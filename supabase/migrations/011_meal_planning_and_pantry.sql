-- Keltia: recipe-linked meal planning, batch cooking and personal pantry.

create table if not exists public.meal_recipes (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  meal_type text not null default 'dinner' check (meal_type in ('breakfast', 'lunch', 'dinner', 'snack')),
  prep_minutes integer check (prep_minutes is null or prep_minutes > 0),
  instructions text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.recipe_ingredients (
  id uuid primary key default gen_random_uuid(),
  recipe_id uuid not null references public.meal_recipes(id) on delete cascade,
  name text not null,
  quantity numeric check (quantity is null or quantity > 0),
  unit text,
  created_at timestamptz not null default now(),
  unique (recipe_id, name)
);

create table if not exists public.member_pantry (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  ingredient_name text not null,
  quantity numeric check (quantity is null or quantity >= 0),
  unit text,
  available boolean not null default true,
  updated_at timestamptz not null default now(),
  unique (user_id, ingredient_name)
);

alter table public.weekly_schedule_items
  add column if not exists recipe_id uuid references public.meal_recipes(id) on delete set null;

create index if not exists weekly_schedule_items_recipe_idx
  on public.weekly_schedule_items (recipe_id);
create index if not exists member_pantry_user_idx
  on public.member_pantry (user_id, ingredient_name);

insert into public.meal_recipes (name, meal_type, prep_minutes, instructions)
values
  ('Céréales + Lait', 'breakfast', 1, 'Verser les céréales dans un bol puis ajouter le lait juste avant de servir.'),
  ('Tartine choco-noisette', 'breakfast', 3, 'Faire griller deux tranches de pain puis étaler la pâte à tartiner.'),
  ('Fruits + yaourt/œufs', 'breakfast', 5, 'Préparer les fruits et servir avec un yaourt ou des œufs.'),
  ('Sandwich dinde/jambon', 'lunch', 5, 'Assembler le pain, la dinde ou le jambon et les crudités.'),
  ('Pâtes Carbonara', 'dinner', 25, 'Cuire les pâtes et le brocoli, puis mélanger hors du feu avec les œufs et la crème.'),
  ('Riz frit aux œufs', 'dinner', 15, 'Faire sauter les poivrons, ajouter le riz froid puis les œufs et la sauce soja.'),
  ('Pâtes Bolognaise', 'dinner', 30, 'Cuire le bœuf dans la sauce tomate puis servir avec les pâtes.'),
  ('Sauté de poulet aux légumes', 'dinner', 30, 'Faire revenir le poulet puis ajouter les légumes et laisser mijoter.'),
  ('Pizza faite maison', 'dinner', 90, 'Préparer la pâte, laisser lever, garnir puis cuire au four.'),
  ('Lasagne maison', 'dinner', 110, 'Préparer les feuilles, la viande et la béchamel, monter puis cuire au four.'),
  ('Salade au poulet et tomates', 'dinner', 25, 'Mariner et cuire le poulet puis l’ajouter à la laitue et aux tomates.'),
  ('Hachis Parmentier', 'dinner', 55, 'Préparer la purée et la viande, assembler puis gratiner.'),
  ('Chili con carne rapide', 'dinner', 30, 'Faire mijoter le bœuf, les haricots, la tomate et les épices.'),
  ('Poulet/porc rôti & lentilles', 'dinner', 60, 'Rôtir la viande et cuire les lentilles avec les aromates.'),
  ('Sandwich œuf-mayo-salade', 'lunch', 12, 'Cuire les œufs, les mélanger à la mayonnaise puis assembler le sandwich.')
on conflict (name) do update set
  meal_type = excluded.meal_type,
  prep_minutes = excluded.prep_minutes,
  instructions = excluded.instructions,
  updated_at = now();

insert into public.recipe_ingredients (recipe_id, name, quantity, unit)
select recipes.id, ingredients.name, ingredients.quantity, ingredients.unit
from (values
  ('Céréales + Lait', 'Céréales', 60, 'g'), ('Céréales + Lait', 'Lait', 200, 'ml'),
  ('Tartine choco-noisette', 'Pain de mie', 2, 'tranches'), ('Tartine choco-noisette', 'Pâte à tartiner choco-noisette', 30, 'g'),
  ('Fruits + yaourt/œufs', 'Fruits frais', 1, 'portion'), ('Fruits + yaourt/œufs', 'Yaourt blanc', 1, 'portion'),
  ('Sandwich dinde/jambon', 'Pain', 2, 'tranches'), ('Sandwich dinde/jambon', 'Dinde ou jambon', 100, 'g'), ('Sandwich dinde/jambon', 'Salade', 30, 'g'),
  ('Pâtes Carbonara', 'Pâtes', 350, 'g'), ('Pâtes Carbonara', 'Œufs', 6, 'unités'), ('Pâtes Carbonara', 'Crème', 250, 'ml'), ('Pâtes Carbonara', 'Brocoli', 1, 'bouquet'),
  ('Riz frit aux œufs', 'Riz', 300, 'g'), ('Riz frit aux œufs', 'Œufs', 5, 'unités'), ('Riz frit aux œufs', 'Poivrons', 2, 'unités'), ('Riz frit aux œufs', 'Sauce soja', 4, 'cuillères'),
  ('Pâtes Bolognaise', 'Pâtes', 350, 'g'), ('Pâtes Bolognaise', 'Bœuf haché', 400, 'g'), ('Pâtes Bolognaise', 'Sauce tomate', 250, 'g'),
  ('Sauté de poulet aux légumes', 'Poulet', 500, 'g'), ('Sauté de poulet aux légumes', 'Légumes variés', 500, 'g'),
  ('Pizza faite maison', 'Farine', 250, 'g'), ('Pizza faite maison', 'Levure boulangère', 1, 'sachet'), ('Pizza faite maison', 'Sauce tomate', 100, 'g'), ('Pizza faite maison', 'Mozzarella', 150, 'g'),
  ('Lasagne maison', 'Farine', 230, 'g'), ('Lasagne maison', 'Œufs', 2, 'unités'), ('Lasagne maison', 'Bœuf haché', 500, 'g'), ('Lasagne maison', 'Sauce tomate', 250, 'g'), ('Lasagne maison', 'Lait', 500, 'ml'), ('Lasagne maison', 'Fromage râpé', 150, 'g'),
  ('Salade au poulet et tomates', 'Poulet', 400, 'g'), ('Salade au poulet et tomates', 'Laitue', 1, 'pièce'), ('Salade au poulet et tomates', 'Tomates', 2, 'unités'),
  ('Hachis Parmentier', 'Pommes de terre', 1000, 'g'), ('Hachis Parmentier', 'Bœuf haché', 400, 'g'), ('Hachis Parmentier', 'Oignon', 1, 'unité'), ('Hachis Parmentier', 'Poivrons', 2, 'unités'), ('Hachis Parmentier', 'Lait', 150, 'ml'),
  ('Chili con carne rapide', 'Bœuf haché', 400, 'g'), ('Chili con carne rapide', 'Haricots rouges', 1, 'boîte'), ('Chili con carne rapide', 'Sauce tomate', 250, 'g'),
  ('Poulet/porc rôti & lentilles', 'Poulet ou porc', 500, 'g'), ('Poulet/porc rôti & lentilles', 'Lentilles', 250, 'g'),
  ('Sandwich œuf-mayo-salade', 'Pain', 2, 'tranches'), ('Sandwich œuf-mayo-salade', 'Œufs', 2, 'unités'), ('Sandwich œuf-mayo-salade', 'Mayonnaise', 1, 'cuillère'), ('Sandwich œuf-mayo-salade', 'Salade', 30, 'g')
) as ingredients(recipe_name, name, quantity, unit)
join public.meal_recipes recipes on recipes.name = ingredients.recipe_name
on conflict (recipe_id, name) do update set quantity = excluded.quantity, unit = excluded.unit;

-- Repeat the seven-day meal rhythm over the current 16-week cycle.
with meals as (
  select * from (values
    (1, 'breakfast', 'Céréales + Lait', false), (1, 'lunch', 'Sandwich dinde/jambon', false), (1, 'dinner', 'Pâtes Carbonara', true),
    (2, 'breakfast', 'Tartine choco-noisette', false), (2, 'lunch', 'Pâtes Carbonara', false), (2, 'dinner', 'Riz frit aux œufs', true),
    (3, 'breakfast', 'Fruits + yaourt/œufs', false), (3, 'lunch', 'Riz frit aux œufs', false), (3, 'dinner', 'Pâtes Bolognaise', true),
    (4, 'breakfast', 'Céréales + Lait', false), (4, 'lunch', 'Pâtes Bolognaise', false), (4, 'dinner', 'Sauté de poulet aux légumes', true),
    (5, 'breakfast', 'Tartine choco-noisette', false), (5, 'lunch', 'Sauté de poulet aux légumes', false), (5, 'dinner', 'Pizza faite maison', true),
    (6, 'breakfast', 'Fruits + yaourt/œufs', false), (6, 'lunch', 'Pizza faite maison', false), (6, 'dinner', 'Lasagne maison', true),
    (7, 'breakfast', 'Céréales + Lait', false), (7, 'lunch', 'Lasagne maison', false), (7, 'dinner', 'Salade au poulet et tomates', true)
  ) as meal(day_of_week, meal_type, recipe_name, cooking_day)
)
insert into public.weekly_schedule_items (week_number, day_of_week, category, title, description, meal_type, preparation_required, shopping_required, recipe_id)
select weeks.week_number, meals.day_of_week, 'food', meals.recipe_name, recipes.instructions, meals.meal_type, meals.cooking_day, meals.cooking_day, recipes.id
from generate_series(1, 16) as weeks(week_number)
cross join meals
join public.meal_recipes recipes on recipes.name = meals.recipe_name
where not exists (
  select 1 from public.weekly_schedule_items existing
  where existing.week_number = weeks.week_number
    and existing.day_of_week = meals.day_of_week
    and existing.category = 'food'
    and existing.meal_type = meals.meal_type
);

alter table public.meal_recipes enable row level security;
alter table public.recipe_ingredients enable row level security;
alter table public.member_pantry enable row level security;

drop policy if exists "Authenticated members can read meal recipes" on public.meal_recipes;
create policy "Authenticated members can read meal recipes" on public.meal_recipes for select to authenticated using (true);
drop policy if exists "Admins can manage meal recipes" on public.meal_recipes;
create policy "Admins can manage meal recipes" on public.meal_recipes for all to authenticated using (public.is_admin()) with check (public.is_admin());
drop policy if exists "Authenticated members can read recipe ingredients" on public.recipe_ingredients;
create policy "Authenticated members can read recipe ingredients" on public.recipe_ingredients for select to authenticated using (true);
drop policy if exists "Admins can manage recipe ingredients" on public.recipe_ingredients;
create policy "Admins can manage recipe ingredients" on public.recipe_ingredients for all to authenticated using (public.is_admin()) with check (public.is_admin());
drop policy if exists "Members can manage their pantry" on public.member_pantry;
create policy "Members can manage their pantry" on public.member_pantry for all to authenticated using (user_id = auth.uid() or public.is_admin()) with check (user_id = auth.uid() or public.is_admin());
