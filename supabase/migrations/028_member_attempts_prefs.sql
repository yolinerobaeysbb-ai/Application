-- Member preferences, exercise attempts, and shopping-list checks for computed ingredients.

alter table public.profiles add column if not exists theme text check (theme in ('light', 'dark'));

create table if not exists public.exercise_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  exercise_id uuid references public.language_exercises(id) on delete cascade,
  course_id uuid references public.language_courses(id) on delete set null,
  answer text not null default '',
  is_correct boolean,
  created_at timestamptz not null default now(),
  unique (user_id, exercise_id)
);

create index if not exists exercise_attempts_user_idx on public.exercise_attempts (user_id, created_at desc);

alter table public.exercise_attempts enable row level security;

drop policy if exists "Members can manage their exercise attempts" on public.exercise_attempts;
create policy "Members can manage their exercise attempts"
on public.exercise_attempts for all to authenticated
using (user_id = auth.uid() or public.is_admin())
with check (user_id = auth.uid() or public.is_admin());

create table if not exists public.member_shopping_checks (
  user_id uuid not null references auth.users(id) on delete cascade,
  week_number integer not null check (week_number between 1 and 16),
  item_name text not null check (char_length(trim(item_name)) between 1 and 200),
  checked boolean not null default true,
  updated_at timestamptz not null default now(),
  primary key (user_id, week_number, item_name)
);

alter table public.member_shopping_checks enable row level security;

drop policy if exists "Members can manage their shopping checks" on public.member_shopping_checks;
create policy "Members can manage their shopping checks"
on public.member_shopping_checks for all to authenticated
using (user_id = auth.uid() or public.is_admin())
with check (user_id = auth.uid() or public.is_admin());
