-- Seeds catalog options into a single deletable table, adds a per-user calendar start date, and a generic trash bin.

insert into public.content_type_options (kind, label) values
  ('language', 'Allemand'), ('language', 'Coréen'), ('language', 'Espagnol'), ('language', 'Italien'),
  ('language', 'Japonais'), ('language', 'Néerlandais'), ('language', 'Thaïlandais'),
  ('sport', 'Musculation'), ('sport', 'Mobilité'), ('sport', 'Cirque'), ('sport', 'Escalade')
on conflict (kind, label) do nothing;

alter table public.profiles add column if not exists calendar_start_date date;

create table if not exists public.trash_items (
  id uuid primary key default gen_random_uuid(),
  table_name text not null,
  record_id text not null,
  payload jsonb not null,
  deleted_by uuid references auth.users(id) on delete set null,
  deleted_at timestamptz not null default now()
);

create index if not exists trash_items_table_idx on public.trash_items (table_name, deleted_at desc);

alter table public.trash_items enable row level security;

create policy "Members can move their own deletions to trash"
on public.trash_items for insert to authenticated
with check (deleted_by = auth.uid() or public.is_admin());

create policy "Owners and admins can read trash"
on public.trash_items for select to authenticated
using (deleted_by = auth.uid() or public.is_admin());

create policy "Owners and admins can clear trash"
on public.trash_items for delete to authenticated
using (deleted_by = auth.uid() or public.is_admin());
