-- Keltia: Add user-specific flexibility to the weekly schedule.
-- This migration updates public.weekly_schedule_items to support personal items,
-- while allowing administrators to define global templates or target specific users.

-- 1. Add user_id column to reference the user owning the schedule item.
-- If user_id is NULL, the item is a global template visible to everyone.
ALTER TABLE public.weekly_schedule_items 
  ADD COLUMN IF NOT EXISTS user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE;

-- 2. Create an index to optimize user-specific lookup queries.
CREATE INDEX IF NOT EXISTS weekly_schedule_items_user_idx 
  ON public.weekly_schedule_items (user_id);

-- 3. Reset and update Row Level Security (RLS) policies to support compartmentalization.
DROP POLICY IF EXISTS "Authenticated members can read weekly schedule" ON public.weekly_schedule_items;
DROP POLICY IF EXISTS "Admins can manage weekly schedule" ON public.weekly_schedule_items;
DROP POLICY IF EXISTS "Members can insert their own schedule items" ON public.weekly_schedule_items;
DROP POLICY IF EXISTS "Members can update their own schedule items" ON public.weekly_schedule_items;
DROP POLICY IF EXISTS "Members can delete their own schedule items" ON public.weekly_schedule_items;

-- SELECT: Members can read global items (NULL), their own items, or everything if they are an admin.
CREATE POLICY "Authenticated members can read weekly schedule"
ON public.weekly_schedule_items FOR SELECT TO authenticated 
USING (user_id IS NULL OR user_id = auth.uid() OR public.is_admin());

-- INSERT: Members can only create items for themselves. Admins can create items for anyone or leave it NULL.
CREATE POLICY "Members can insert their own schedule items"
ON public.weekly_schedule_items FOR INSERT TO authenticated 
WITH CHECK (user_id = auth.uid() OR public.is_admin());

-- UPDATE: Members can only update their own items. Admins can modify any item.
CREATE POLICY "Members can update their own schedule items"
ON public.weekly_schedule_items FOR UPDATE TO authenticated 
USING (user_id = auth.uid() OR public.is_admin())
WITH CHECK (user_id = auth.uid() OR public.is_admin());

-- DELETE: Members can only delete their own items. Admins can delete any item.
CREATE POLICY "Members can delete their own schedule items"
ON public.weekly_schedule_items FOR DELETE TO authenticated 
USING (user_id = auth.uid() OR public.is_admin());
