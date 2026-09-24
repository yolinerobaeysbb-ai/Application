-- Recurrence, schedule times, fixed activities, member exercises, health check-ins, calendar feed tokens.

alter table public.weekly_schedule_items drop constraint if exists weekly_schedule_items_category_check;
alter table public.weekly_schedule_items add constraint weekly_schedule_items_category_check check (category in ('language', 'sport', 'food', 'fixed'));
alter table public.weekly_schedule_items add column if not exists recurrence text not null default 'once' check (recurrence in ('once', 'daily', 'weekly', 'biweekly'));
alter table public.weekly_schedule_items add column if not exists start_time time;
alter table public.weekly_schedule_items add column if not exists end_time time;

alter table public.module_comments drop constraint if exists module_comments_target_type_check;
alter table public.module_comments add constraint module_comments_target_type_check check (target_type in ('language_course', 'workout_session', 'meal_recipe', 'fixed_activity'));

insert into public.app_settings (setting_key, setting_value)
values ('program_start_date', to_char(current_date, 'YYYY-MM-DD'))
on conflict (setting_key) do nothing;

alter table public.language_exercises drop constraint if exists language_exercises_origin_check;
alter table public.language_exercises add constraint language_exercises_origin_check check (origin in ('manual', 'generated', 'member'));
alter table public.language_exercises add column if not exists created_by uuid references auth.users(id) on delete cascade;

drop policy if exists "Authenticated members can read language exercises" on public.language_exercises;
create policy "Authenticated members can read language exercises"
on public.language_exercises for select to authenticated
using (origin <> 'member' or created_by = auth.uid() or public.is_admin());

drop policy if exists "Admins can manage language exercises" on public.language_exercises;
create policy "Admins can manage language exercises"
on public.language_exercises for all to authenticated using (public.is_admin()) with check (public.is_admin());

create policy "Members can add their own exercises"
on public.language_exercises for insert to authenticated
with check (origin = 'member' and created_by = auth.uid());

create policy "Members can edit their own exercises"
on public.language_exercises for update to authenticated
using (created_by = auth.uid()) with check (created_by = auth.uid());

create policy "Members can delete their own exercises"
on public.language_exercises for delete to authenticated
using (created_by = auth.uid());

create table if not exists public.health_checkins (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  energy_level text not null check (energy_level in ('energetic', 'normal', 'tired', 'exhausted')),
  sleep_hours numeric check (sleep_hours is null or sleep_hours between 0 and 24),
  stress_level text check (stress_level in ('low', 'medium', 'high')),
  diet_quality text check (diet_quality in ('poor', 'average', 'good')),
  available_minutes integer check (available_minutes is null or available_minutes >= 0),
  notes text not null default '',
  created_at timestamptz not null default now()
);

create index if not exists health_checkins_user_idx on public.health_checkins (user_id, created_at desc);

alter table public.health_checkins enable row level security;

create policy "Members can manage their health checkins"
on public.health_checkins for all to authenticated
using (user_id = auth.uid() or public.is_admin())
with check (user_id = auth.uid() or public.is_admin());

create table if not exists public.calendar_feed_tokens (
  user_id uuid primary key references auth.users(id) on delete cascade,
  token text not null unique default encode(gen_random_bytes(24), 'hex'),
  created_at timestamptz not null default now()
);

alter table public.calendar_feed_tokens enable row level security;

create policy "Members can manage their calendar token"
on public.calendar_feed_tokens for all to authenticated
using (user_id = auth.uid())
with check (user_id = auth.uid());
