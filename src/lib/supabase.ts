import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY
const sessionKey = typeof window !== 'undefined' ? new URLSearchParams(window.location.search).get('session_key') : null
const storageKey = sessionKey?.startsWith('keltia-impersonation-') ? `keltia-auth-${sessionKey}` : 'keltia-auth'

export const isSupabaseConfigured = Boolean(supabaseUrl && supabaseAnonKey)
export const supabase = createClient(supabaseUrl || 'https://placeholder.supabase.co', supabaseAnonKey || 'placeholder-anon-key', { auth: { storageKey } })