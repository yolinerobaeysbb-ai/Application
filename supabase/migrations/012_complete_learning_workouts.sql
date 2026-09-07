-- Keltia: complete course exercises, workout sessions and member comments.

alter table public.language_exercises
  add column if not exists exercise_type text not null default 'written' check (exercise_type in ('written', 'oral')),
  add column if not exists explanation text not null default '',
  add column if not exists expected_answer text not null default '';

alter table public.meal_recipes
  add column if not exists servings integer not null default 1 check (servings > 0),
  add column if not exists preparation_steps text not null default '';

create table if not exists public.workout_sessions (
  id uuid primary key default gen_random_uuid(),
  schedule_item_id uuid unique references public.weekly_schedule_items(id) on delete cascade,
  program text not null,
  session_name text not null,
  warmup text not null default '',
  main_workout text not null default '',
  cooldown text not null default '',
  equipment text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.module_comments (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  target_type text not null check (target_type in ('language_course', 'workout_session', 'meal_recipe')),
  target_id uuid not null,
  message text not null check (char_length(trim(message)) between 1 and 2000),
  created_at timestamptz not null default now()
);

create index if not exists module_comments_target_idx
  on public.module_comments (target_type, target_id, created_at desc);

alter table public.language_exercises enable row level security;
alter table public.workout_sessions enable row level security;
alter table public.module_comments enable row level security;

drop policy if exists "Authenticated members can read workout sessions" on public.workout_sessions;
create policy "Authenticated members can read workout sessions"
on public.workout_sessions for select to authenticated using (true);
drop policy if exists "Admins can manage workout sessions" on public.workout_sessions;
create policy "Admins can manage workout sessions"
on public.workout_sessions for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Authenticated members can read language exercises" on public.language_exercises;
create policy "Authenticated members can read language exercises"
on public.language_exercises for select to authenticated using (true);
drop policy if exists "Admins can manage language exercises" on public.language_exercises;
create policy "Admins can manage language exercises"
on public.language_exercises for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Members can read module comments" on public.module_comments;
create policy "Members can read module comments"
on public.module_comments for select to authenticated using (user_id = auth.uid() or public.is_admin());
drop policy if exists "Members can create module comments" on public.module_comments;
create policy "Members can create module comments"
on public.module_comments for insert to authenticated with check (user_id = auth.uid());
drop policy if exists "Members can update their module comments" on public.module_comments;
create policy "Members can update their module comments"
on public.module_comments for update to authenticated using (user_id = auth.uid() or public.is_admin()) with check (user_id = auth.uid() or public.is_admin());
drop policy if exists "Members can delete their module comments" on public.module_comments;
create policy "Members can delete their module comments"
on public.module_comments for delete to authenticated using (user_id = auth.uid() or public.is_admin());

-- Seed one structured workout record for each existing sport schedule item.
insert into public.workout_sessions (schedule_item_id, program, session_name, warmup, main_workout, cooldown, equipment)
select id, split_part(title, ' · ', 1), split_part(title, ' · ', 2),
  'Mobilité articulaire et montée progressive en température · 10 min.',
  'Suivre la séance du programme fourni. Noter les charges, répétitions et sensations dans le suivi.',
  'Respiration, étirements doux et retour au calme · 5 à 10 min.',
  'Voir le fichier programme associé dans Supports.'
from public.weekly_schedule_items item
where item.category = 'sport'
on conflict (schedule_item_id) do nothing;
