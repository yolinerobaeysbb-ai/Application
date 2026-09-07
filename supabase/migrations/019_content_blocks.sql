-- Keltia: editable blocks for the main learning surfaces.

create table if not exists public.content_blocks (
  id uuid primary key default gen_random_uuid(),
  surface text not null check (surface in ('courses', 'progress', 'resources')),
  title text not null,
  body text not null default '',
  block_type text not null default 'text' check (block_type in ('text', 'link', 'chart')),
  config jsonb not null default '{}'::jsonb,
  position integer not null default 1,
  width integer not null default 1 check (width between 1 and 3),
  visible boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists content_blocks_surface_position_idx
  on public.content_blocks (surface, visible, position);

alter table public.content_blocks enable row level security;

drop policy if exists "Authenticated members can read visible content blocks" on public.content_blocks;
create policy "Authenticated members can read visible content blocks"
  on public.content_blocks for select to authenticated
  using (visible or public.is_admin());

drop policy if exists "Admins can manage content blocks" on public.content_blocks;
create policy "Admins can manage content blocks"
  on public.content_blocks for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

create or replace function public.set_content_blocks_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists content_blocks_updated_at on public.content_blocks;
create trigger content_blocks_updated_at
before update on public.content_blocks
for each row execute function public.set_content_blocks_updated_at();
