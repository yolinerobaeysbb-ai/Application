import { supabase } from './supabase'

/** Snapshots a row into the trash bin before deleting it, so it can be restored later. */
export async function trashDelete(table: string, row: { id: string } & Record<string, unknown>): Promise<{ error: string | null }> {
  const { data: userData } = await supabase.auth.getUser()
  const trashInsert = await supabase.from('trash_items').insert({ table_name: table, record_id: row.id, payload: row, deleted_by: userData.user?.id ?? null })
  if (trashInsert.error) return { error: trashInsert.error.message }
  const deleteResult = await supabase.from(table).delete().eq('id', row.id)
  return { error: deleteResult.error?.message ?? null }
}
