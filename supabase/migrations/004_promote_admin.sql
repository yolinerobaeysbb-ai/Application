insert into public.profiles (id, email, role)
select id, email, 'admin'
from auth.users
where lower(email) = 'yoline.robaeysbb@gmail.com'
on conflict (id) do update
set email = excluded.email,
    role = 'admin';

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, email, role)
  values (
    new.id,
    new.email,
    case when lower(new.email) = 'yoline.robaeysbb@gmail.com' then 'admin' else 'member' end
  )
  on conflict (id) do update
  set email = excluded.email,
      role = case when lower(excluded.email) = 'yoline.robaeysbb@gmail.com' then 'admin' else public.profiles.role end;
  return new;
end;
$$;
