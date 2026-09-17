create table if not exists public.impersonation_audit (
  id uuid primary key default gen_random_uuid(),
  admin_id uuid not null references auth.users(id) on delete cascade,
  target_user_id uuid not null references auth.users(id) on delete cascade,
  started_at timestamptz not null default now()
);

alter table public.impersonation_audit enable row level security;

create policy "Admins can read impersonation audit"
on public.impersonation_audit for select
to authenticated
using (public.is_admin());

create policy "Admins can insert impersonation audit"
on public.impersonation_audit for insert
to authenticated
with check (public.is_admin() and admin_id = auth.uid());
