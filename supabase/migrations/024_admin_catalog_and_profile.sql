-- Adds admin-managed catalog options, recipe photos, and user profile customization.
alter table public.profiles add column if not exists display_name text;

alter table public.meal_recipes add column if not exists photo_url text;

create table if not exists public.content_type_options (
  id uuid primary key default gen_random_uuid(),
  kind text not null check (kind in ('language', 'sport', 'food')),
  label text not null check (char_length(trim(label)) between 1 and 120),
  icon_key text,
  created_at timestamptz not null default now(),
  unique (kind, label)
);

alter table public.content_type_options enable row level security;

create policy "Everyone can read content options"
on public.content_type_options for select
to authenticated
using (true);

create policy "Admins can manage content options"
on public.content_type_options for all
to authenticated
using (public.is_admin())
with check (public.is_admin());
