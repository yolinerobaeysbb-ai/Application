-- Keltia: member-configurable progress visualizations.

create table if not exists public.progress_visualizations (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  visualization_type text not null check (visualization_type in ('line', 'bar', 'table')),
  metric text not null check (metric in ('sport_weight', 'sport_completed', 'nutrition_rate', 'nutrition_planned', 'nutrition_completed', 'language_score')),
  position integer not null default 1,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists progress_visualizations_user_position_idx
  on public.progress_visualizations (user_id, position);

alter table public.progress_visualizations enable row level security;

drop policy if exists "Members can read their progress visualizations" on public.progress_visualizations;
create policy "Members can read their progress visualizations"
  on public.progress_visualizations for select to authenticated
  using (user_id = auth.uid() or public.is_admin());

drop policy if exists "Members can manage their progress visualizations" on public.progress_visualizations;
create policy "Members can manage their progress visualizations"
  on public.progress_visualizations for all to authenticated
  using (user_id = auth.uid() or public.is_admin())
  with check (user_id = auth.uid() or public.is_admin());
