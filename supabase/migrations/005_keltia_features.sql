-- Keltia: planning detail, native courses, progress tracking and admin notifications.
-- This migration is additive and keeps the existing Phoenix tables intact.

create table if not exists public.weekly_schedule_items (
  id uuid primary key default gen_random_uuid(),
  week_number integer not null check (week_number between 1 and 16),
  day_of_week integer not null check (day_of_week between 1 and 7),
  category text not null check (category in ('language', 'sport', 'food')),
  title text not null check (char_length(trim(title)) between 1 and 200),
  description text not null default '',
  duration_minutes integer check (duration_minutes is null or duration_minutes > 0),
  meal_type text,
  preparation_required boolean not null default false,
  shopping_required boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists weekly_schedule_items_week_day_idx
  on public.weekly_schedule_items (week_number, day_of_week);

create table if not exists public.shopping_items (
  id uuid primary key default gen_random_uuid(),
  week_number integer not null check (week_number between 1 and 16),
  name text not null check (char_length(trim(name)) between 1 and 200),
  quantity numeric check (quantity is null or quantity > 0),
  unit text,
  category text,
  source_recipe text,
  created_by uuid not null default auth.uid() references auth.users(id) on delete restrict,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists shopping_items_week_idx
  on public.shopping_items (week_number);

create table if not exists public.shopping_item_checks (
  shopping_item_id uuid not null references public.shopping_items(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  checked boolean not null default false,
  updated_at timestamptz not null default now(),
  primary key (shopping_item_id, user_id)
);

create table if not exists public.language_courses (
  id uuid primary key default gen_random_uuid(),
  language text not null,
  title text not null check (char_length(trim(title)) between 1 and 200),
  level text,
  course_number integer not null check (course_number > 0),
  week_number integer check (week_number is null or week_number between 1 and 16),
  summary text not null default '',
  theory text not null default '',
  examples text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (language, course_number)
);

create index if not exists language_courses_language_idx
  on public.language_courses (language, course_number);

create table if not exists public.language_exercises (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references public.language_courses(id) on delete cascade,
  prompt text not null check (char_length(trim(prompt)) between 1 and 2000),
  answer text not null default '',
  position integer not null default 1 check (position > 0),
  created_at timestamptz not null default now(),
  unique (course_id, position)
);

create table if not exists public.sport_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  recorded_on date not null default current_date,
  exercise_name text not null check (char_length(trim(exercise_name)) between 1 and 200),
  weight_kg numeric check (weight_kg is null or weight_kg >= 0),
  repetitions integer check (repetitions is null or repetitions > 0),
  completed boolean not null default false,
  notes text not null default '',
  created_at timestamptz not null default now()
);

create index if not exists sport_progress_user_date_idx
  on public.sport_progress (user_id, recorded_on desc);

create table if not exists public.nutrition_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  recorded_on date not null default current_date,
  meals_planned integer not null default 0 check (meals_planned >= 0),
  meals_completed integer not null default 0 check (meals_completed >= 0 and meals_completed <= meals_planned),
  preparation_completed boolean not null default false,
  notes text not null default '',
  created_at timestamptz not null default now()
);

create index if not exists nutrition_progress_user_date_idx
  on public.nutrition_progress (user_id, recorded_on desc);

create table if not exists public.language_placement_tests (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  language text not null,
  score numeric not null check (score >= 0 and score <= 100),
  level text,
  test_month date not null,
  completed_at timestamptz not null default now(),
  unique (user_id, language, test_month)
);

create index if not exists language_placement_tests_user_date_idx
  on public.language_placement_tests (user_id, completed_at desc);

create table if not exists public.admin_notifications (
  id uuid primary key default gen_random_uuid(),
  type text not null check (type in ('new_suggestion', 'placement_test_completed')),
  title text not null,
  message text not null,
  member_id uuid references auth.users(id) on delete set null,
  suggestion_id uuid references public.suggestions(id) on delete cascade,
  placement_test_id uuid references public.language_placement_tests(id) on delete cascade,
  metadata jsonb not null default '{}'::jsonb,
  read_at timestamptz,
  created_at timestamptz not null default now(),
  constraint admin_notification_source_check check (
    (type = 'new_suggestion' and suggestion_id is not null and placement_test_id is null)
    or (type = 'placement_test_completed' and placement_test_id is not null and suggestion_id is null)
  )
);

create index if not exists admin_notifications_unread_idx
  on public.admin_notifications (created_at desc)
  where read_at is null;

-- Keep updated_at values consistent for rows edited from the application.
create or replace function public.set_keltia_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists weekly_schedule_items_updated_at on public.weekly_schedule_items;
create trigger weekly_schedule_items_updated_at before update on public.weekly_schedule_items
for each row execute function public.set_keltia_updated_at();

drop trigger if exists shopping_items_updated_at on public.shopping_items;
create trigger shopping_items_updated_at before update on public.shopping_items
for each row execute function public.set_keltia_updated_at();

drop trigger if exists shopping_item_checks_updated_at on public.shopping_item_checks;
create trigger shopping_item_checks_updated_at before update on public.shopping_item_checks
for each row execute function public.set_keltia_updated_at();

drop trigger if exists language_courses_updated_at on public.language_courses;
create trigger language_courses_updated_at before update on public.language_courses
for each row execute function public.set_keltia_updated_at();

-- Notifications are generated in the database so every client path is covered.
create or replace function public.notify_admin_of_suggestion()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  member_email text;
begin
  select email into member_email from public.profiles where id = new.user_id;
  insert into public.admin_notifications (type, title, message, member_id, suggestion_id, metadata)
  values (
    'new_suggestion',
    'Nouvelle suggestion',
    coalesce(member_email, 'Un membre') || ' a envoyé une suggestion : ' || left(new.message, 180),
    new.user_id,
    new.id,
    jsonb_build_object('category', new.category)
  );
  return new;
end;
$$;

drop trigger if exists suggestions_admin_notification on public.suggestions;
create trigger suggestions_admin_notification
after insert on public.suggestions
for each row execute function public.notify_admin_of_suggestion();

create or replace function public.notify_admin_of_placement_test()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  member_email text;
begin
  select email into member_email from public.profiles where id = new.user_id;
  insert into public.admin_notifications (type, title, message, member_id, placement_test_id, metadata)
  values (
    'placement_test_completed',
    'Test de positionnement terminé',
    coalesce(member_email, 'Un membre') || ' a obtenu ' || new.score::text || '/100 en ' || new.language,
    new.user_id,
    new.id,
    jsonb_build_object('language', new.language, 'score', new.score, 'level', new.level, 'test_month', new.test_month)
  );
  return new;
end;
$$;

drop trigger if exists placement_tests_admin_notification on public.language_placement_tests;
create trigger placement_tests_admin_notification
after insert on public.language_placement_tests
for each row execute function public.notify_admin_of_placement_test();

alter table public.weekly_schedule_items enable row level security;
alter table public.shopping_items enable row level security;
alter table public.shopping_item_checks enable row level security;
alter table public.language_courses enable row level security;
alter table public.language_exercises enable row level security;
alter table public.sport_progress enable row level security;
alter table public.nutrition_progress enable row level security;
alter table public.language_placement_tests enable row level security;
alter table public.admin_notifications enable row level security;

drop policy if exists "Authenticated members can read weekly schedule" on public.weekly_schedule_items;
drop policy if exists "Admins can manage weekly schedule" on public.weekly_schedule_items;
drop policy if exists "Authenticated members can read shopping items" on public.shopping_items;
drop policy if exists "Admins can manage shopping items" on public.shopping_items;
drop policy if exists "Members can read their shopping checks" on public.shopping_item_checks;
drop policy if exists "Members can create their shopping checks" on public.shopping_item_checks;
drop policy if exists "Members can update their shopping checks" on public.shopping_item_checks;
drop policy if exists "Members can delete their shopping checks" on public.shopping_item_checks;
drop policy if exists "Authenticated members can read language courses" on public.language_courses;
drop policy if exists "Admins can manage language courses" on public.language_courses;
drop policy if exists "Authenticated members can read language exercises" on public.language_exercises;
drop policy if exists "Admins can manage language exercises" on public.language_exercises;
drop policy if exists "Members can read their sport progress" on public.sport_progress;
drop policy if exists "Members can create their sport progress" on public.sport_progress;
drop policy if exists "Members can update their sport progress" on public.sport_progress;
drop policy if exists "Members can delete their sport progress" on public.sport_progress;
drop policy if exists "Members can read their nutrition progress" on public.nutrition_progress;
drop policy if exists "Members can create their nutrition progress" on public.nutrition_progress;
drop policy if exists "Members can update their nutrition progress" on public.nutrition_progress;
drop policy if exists "Members can delete their nutrition progress" on public.nutrition_progress;
drop policy if exists "Members can read their placement tests" on public.language_placement_tests;
drop policy if exists "Members can create their placement tests" on public.language_placement_tests;
drop policy if exists "Members can update their placement tests" on public.language_placement_tests;
drop policy if exists "Admins can read notifications" on public.admin_notifications;
drop policy if exists "Admins can update notifications" on public.admin_notifications;
drop policy if exists "Admins can delete notifications" on public.admin_notifications;

create policy "Authenticated members can read weekly schedule"
on public.weekly_schedule_items for select to authenticated using (true);
create policy "Admins can manage weekly schedule"
on public.weekly_schedule_items for all to authenticated using (public.is_admin()) with check (public.is_admin());

create policy "Authenticated members can read shopping items"
on public.shopping_items for select to authenticated using (true);
create policy "Admins can manage shopping items"
on public.shopping_items for all to authenticated using (public.is_admin()) with check (public.is_admin());

create policy "Members can read their shopping checks"
on public.shopping_item_checks for select to authenticated using (user_id = auth.uid() or public.is_admin());
create policy "Members can create their shopping checks"
on public.shopping_item_checks for insert to authenticated with check (user_id = auth.uid() or public.is_admin());
create policy "Members can update their shopping checks"
on public.shopping_item_checks for update to authenticated using (user_id = auth.uid() or public.is_admin()) with check (user_id = auth.uid() or public.is_admin());
create policy "Members can delete their shopping checks"
on public.shopping_item_checks for delete to authenticated using (user_id = auth.uid() or public.is_admin());

create policy "Authenticated members can read language courses"
on public.language_courses for select to authenticated using (true);
create policy "Admins can manage language courses"
on public.language_courses for all to authenticated using (public.is_admin()) with check (public.is_admin());
create policy "Authenticated members can read language exercises"
on public.language_exercises for select to authenticated using (true);
create policy "Admins can manage language exercises"
on public.language_exercises for all to authenticated using (public.is_admin()) with check (public.is_admin());

create policy "Members can read their sport progress"
on public.sport_progress for select to authenticated using (user_id = auth.uid() or public.is_admin());
create policy "Members can create their sport progress"
on public.sport_progress for insert to authenticated with check (user_id = auth.uid());
create policy "Members can update their sport progress"
on public.sport_progress for update to authenticated using (user_id = auth.uid() or public.is_admin()) with check (user_id = auth.uid() or public.is_admin());
create policy "Members can delete their sport progress"
on public.sport_progress for delete to authenticated using (user_id = auth.uid() or public.is_admin());

create policy "Members can read their nutrition progress"
on public.nutrition_progress for select to authenticated using (user_id = auth.uid() or public.is_admin());
create policy "Members can create their nutrition progress"
on public.nutrition_progress for insert to authenticated with check (user_id = auth.uid());
create policy "Members can update their nutrition progress"
on public.nutrition_progress for update to authenticated using (user_id = auth.uid() or public.is_admin()) with check (user_id = auth.uid() or public.is_admin());
create policy "Members can delete their nutrition progress"
on public.nutrition_progress for delete to authenticated using (user_id = auth.uid() or public.is_admin());

create policy "Members can read their placement tests"
on public.language_placement_tests for select to authenticated using (user_id = auth.uid() or public.is_admin());
create policy "Members can create their placement tests"
on public.language_placement_tests for insert to authenticated with check (user_id = auth.uid());
create policy "Members can update their placement tests"
on public.language_placement_tests for update to authenticated using (user_id = auth.uid() or public.is_admin()) with check (user_id = auth.uid() or public.is_admin());

create policy "Admins can read notifications"
on public.admin_notifications for select to authenticated using (public.is_admin());
create policy "Admins can update notifications"
on public.admin_notifications for update to authenticated using (public.is_admin()) with check (public.is_admin());
create policy "Admins can delete notifications"
on public.admin_notifications for delete to authenticated using (public.is_admin());

-- Add Realtime only when the table is not already attached to the publication.
do $$
begin
  if not exists (
    select 1
    from pg_publication_rel pr
    join pg_class c on c.oid = pr.prrelid
    join pg_namespace n on n.oid = c.relnamespace
    join pg_publication p on p.oid = pr.prpubid
    where p.pubname = 'supabase_realtime'
      and n.nspname = 'public'
      and c.relname = 'admin_notifications'
  ) then
    alter publication supabase_realtime add table public.admin_notifications;
  end if;
end;
$$;
