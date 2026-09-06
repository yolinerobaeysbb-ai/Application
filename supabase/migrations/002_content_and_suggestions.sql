create table if not exists public.content_items (
  id uuid primary key default gen_random_uuid(),
  category text not null check (category in ('language', 'sport', 'food')),
  language text,
  week integer not null default 1 check (week between 1 and 16),
  title text not null,
  description text not null default '',
  body text not null default '',
  file_url text,
  duration_minutes integer check (duration_minutes is null or duration_minutes > 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint language_required_for_language_content check (category <> 'language' or language is not null)
);

create index if not exists content_items_week_category_idx on public.content_items (week, category);
create index if not exists content_items_language_idx on public.content_items (language);

create table if not exists public.suggestions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  category text not null check (category in ('fonctionnalite', 'langue', 'sport', 'nourriture', 'autre')),
  message text not null check (char_length(trim(message)) between 3 and 2000),
  status text not null default 'pending' check (status in ('pending', 'treated', 'deleted')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists suggestions_status_created_at_idx on public.suggestions (status, created_at desc);

do $$
begin
  if not exists (select 1 from pg_constraint where conname = 'suggestions_user_id_profiles_fkey') then
    alter table public.suggestions
      add constraint suggestions_user_id_profiles_fkey foreign key (user_id) references public.profiles(id) on delete cascade;
  end if;
end;
$$;

alter table public.content_items enable row level security;
alter table public.suggestions enable row level security;

drop policy if exists "Authenticated members can read content" on public.content_items;
create policy "Authenticated members can read content"
on public.content_items for select
to authenticated
using (true);

drop policy if exists "Admins can insert content" on public.content_items;
create policy "Admins can insert content"
on public.content_items for insert
to authenticated
with check (public.is_admin());

drop policy if exists "Admins can update content" on public.content_items;
create policy "Admins can update content"
on public.content_items for update
to authenticated
using (public.is_admin())
with check (public.is_admin());

drop policy if exists "Admins can delete content" on public.content_items;
create policy "Admins can delete content"
on public.content_items for delete
to authenticated
using (public.is_admin());

drop policy if exists "Members can create suggestions" on public.suggestions;
create policy "Members can create suggestions"
on public.suggestions for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists "Members can read their suggestions" on public.suggestions;
create policy "Members can read their suggestions"
on public.suggestions for select
to authenticated
using (user_id = auth.uid() or public.is_admin());

drop policy if exists "Admins can update suggestions" on public.suggestions;
create policy "Admins can update suggestions"
on public.suggestions for update
to authenticated
using (public.is_admin())
with check (public.is_admin());

drop policy if exists "Admins can delete suggestions" on public.suggestions;
create policy "Admins can delete suggestions"
on public.suggestions for delete
to authenticated
using (public.is_admin());

insert into public.content_items (category, language, week, title, description)
select 'language', language, 1, 'Premier cours', 'Ajoute le contenu détaillé de cette semaine depuis l’espace admin.'
from unnest(array['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaïlandais']) as language
where not exists (select 1 from public.content_items);
