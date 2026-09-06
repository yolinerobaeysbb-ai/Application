insert into storage.buckets (id, name, public)
values ('phoenix-documents', 'phoenix-documents', false)
on conflict (id) do update set public = false;

create table if not exists public.documents (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  category text not null check (category in ('language', 'sport', 'food')),
  language text,
  file_path text not null unique,
  file_name text not null,
  mime_type text not null default 'application/octet-stream',
  file_size bigint,
  created_at timestamptz not null default now(),
  constraint document_language_required check (category <> 'language' or language is not null)
);

alter table public.documents enable row level security;

drop policy if exists "Authenticated members can read documents" on public.documents;
create policy "Authenticated members can read documents"
on public.documents for select
to authenticated
using (true);

drop policy if exists "Admins can insert documents" on public.documents;
create policy "Admins can insert documents"
on public.documents for insert
to authenticated
with check (public.is_admin());

drop policy if exists "Admins can update documents" on public.documents;
create policy "Admins can update documents"
on public.documents for update
to authenticated
using (public.is_admin())
with check (public.is_admin());

drop policy if exists "Admins can delete documents" on public.documents;
create policy "Admins can delete documents"
on public.documents for delete
to authenticated
using (public.is_admin());

drop policy if exists "Members can read document files" on storage.objects;
create policy "Members can read document files"
on storage.objects for select
to authenticated
using (bucket_id = 'phoenix-documents');

drop policy if exists "Admins can upload document files" on storage.objects;
create policy "Admins can upload document files"
on storage.objects for insert
to authenticated
with check (bucket_id = 'phoenix-documents' and public.is_admin());

drop policy if exists "Admins can update document files" on storage.objects;
create policy "Admins can update document files"
on storage.objects for update
to authenticated
using (bucket_id = 'phoenix-documents' and public.is_admin())
with check (bucket_id = 'phoenix-documents' and public.is_admin());

drop policy if exists "Admins can delete document files" on storage.objects;
create policy "Admins can delete document files"
on storage.objects for delete
to authenticated
using (bucket_id = 'phoenix-documents' and public.is_admin());
