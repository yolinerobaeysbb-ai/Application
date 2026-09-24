-- Recipe photos are shown via public URLs; allow anonymous read access to that folder only.
create policy "Anyone can view recipe photos"
on storage.objects for select
to public
using (bucket_id = 'phoenix-documents' and (storage.foldername(name))[1] = 'recipes');
