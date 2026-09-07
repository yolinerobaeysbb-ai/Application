-- Keltia: editable interface copy and richer course authoring.

create table if not exists public.app_settings (
  setting_key text primary key,
  setting_value text not null default '',
  updated_at timestamptz not null default now()
);

alter table public.language_courses
  add column if not exists data jsonb not null default '{}'::jsonb;

alter table public.language_exercises
  add column if not exists difficulty text not null default 'standard',
  add column if not exists options jsonb not null default '[]'::jsonb,
  add column if not exists accepted_answers text[] not null default '{}',
  add column if not exists origin text not null default 'manual' check (origin in ('manual', 'generated'));

alter table public.language_course_resources
  add column if not exists position integer not null default 1,
  add column if not exists provider text,
  add column if not exists transcript text;

alter table public.app_settings enable row level security;
drop policy if exists "Public can read app settings" on public.app_settings;
create policy "Public can read app settings" on public.app_settings for select using (true);
drop policy if exists "Admins can manage app settings" on public.app_settings;
create policy "Admins can manage app settings" on public.app_settings for all to authenticated using (public.is_admin()) with check (public.is_admin());

insert into public.app_settings (setting_key, setting_value) values
  ('brand_name', 'Keltia'),
  ('welcome_title', 'Votre espace pour progresser.'),
  ('welcome_text', 'Un parcours clair pour apprendre, bouger et prendre soin de votre équilibre.'),
  ('login_hero_title', 'Un rythme qui vous ressemble.'),
  ('login_hero_text', 'Langues, mouvement et nutrition réunis dans un espace simple, calme et privé.'),
  ('login_title', 'Bienvenue.'),
  ('login_text', 'Connectez-vous pour retrouver votre parcours.'),
  ('login_button', 'Ouvrir mon espace')
on conflict (setting_key) do nothing;
