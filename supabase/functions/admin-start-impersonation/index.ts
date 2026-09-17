import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': Deno.env.get('APP_ORIGIN') ?? '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
}

Deno.serve(async (request) => {
  if (request.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders })
  if (request.method !== 'POST') return new Response('Method not allowed', { status: 405, headers: corsHeaders })

  const response = (body: Record<string, unknown>, status = 200) => new Response(JSON.stringify(body), { status, headers: { ...corsHeaders, 'Content-Type': 'application/json' } })
  const authorization = request.headers.get('Authorization')
  if (!authorization?.startsWith('Bearer ')) return response({ error: 'Authentication required' }, 401)

  const url = Deno.env.get('SUPABASE_URL')!
  const anonKey = Deno.env.get('SUPABASE_ANON_KEY')!
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  const callerClient = createClient(url, anonKey, { global: { headers: { Authorization: authorization } } })
  const adminClient = createClient(url, serviceRoleKey)
  const { data: { user: caller }, error: callerError } = await callerClient.auth.getUser()
  if (callerError || !caller) return response({ error: 'Invalid session' }, 401)

  const { data: adminProfile } = await adminClient.from('profiles').select('role').eq('id', caller.id).maybeSingle()
  if (adminProfile?.role !== 'admin') return response({ error: 'Administrator access required' }, 403)

  const body = await request.json().catch(() => null) as { userId?: string } | null
  if (!body?.userId) return response({ error: 'userId is required' }, 400)
  const { data: target } = await adminClient.from('profiles').select('id, email').eq('id', body.userId).maybeSingle()
  if (!target) return response({ error: 'User not found' }, 404)

  const { data: link, error: linkError } = await adminClient.auth.admin.generateLink({
    type: 'magiclink',
    email: target.email,
    options: { redirectTo: `${url}/?impersonation=1` },
  })
  if (linkError || !link?.properties?.hashed_token) return response({ error: 'Unable to create the isolated session' }, 500)

  await adminClient.from('impersonation_audit').insert({ admin_id: caller.id, target_user_id: target.id })

  return response({ token_hash: link.properties.hashed_token, user: { id: target.id, email: target.email } })
})
