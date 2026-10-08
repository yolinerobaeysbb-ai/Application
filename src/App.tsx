import { useEffect, useState } from 'react'
import { Activity, BookOpen, FolderOpen, Languages, LayoutDashboard, LogOut, Menu, MessageSquarePlus, Moon, Settings, ShieldCheck, Sun, UserRound, X } from 'lucide-react'
import { isSupabaseConfigured, supabase } from './lib/supabase'
import { programWeekForDate } from './lib/schedule'
import PlanningV2 from './Planning'
import SuggestionsV2 from './Suggestions'
import NotificationBell from './NotificationBell'
import ProgressDashboard from './ProgressDashboard'
import CourseHub from './CourseHub'
import Supports from './Supports'
import LanguageRecap from './LanguageRecap'
import AdminDashboard from './AdminDashboard'
import './App.css'

const ADMIN_EMAIL = 'yoline.robaeysbb@gmail.com'
const tabs = ['planning', 'courses', 'recap', 'resources', 'progress', 'suggestions', 'settings', 'admin'] as const
type Tab = (typeof tabs)[number]
type UiText = Record<string, string>
type LoginProps = { email: string; password: string; setEmail: (value: string) => void; setPassword: (value: string) => void; onSubmit: (event: React.FormEvent) => void; onReset: () => void; error: string; loading: boolean; uiText?: UiText }

function tabFromPath(pathname: string): Tab {
  const segment = pathname.replace(/^\//, '').split('/')[0]
  return tabs.includes(segment as Tab) ? (segment as Tab) : 'planning'
}

function pathForTab(tab: Tab) {
  return tab === 'planning' ? '/' : `/${tab}`
}

function firstName(value: string) {
  const first = value.trim().split(/[\s._-]+/)[0] ?? ''
  return first ? first.charAt(0).toUpperCase() + first.slice(1).toLowerCase() : ''
}

function App() {
  const [session, setSession] = useState<Awaited<ReturnType<typeof supabase.auth.getSession>>['data']['session']>(null)
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [authError, setAuthError] = useState('')
  const [loading, setLoading] = useState(false)
  const [tab, setTab] = useState<Tab>(() => (typeof window === 'undefined' ? 'planning' : tabFromPath(window.location.pathname)))
  const [week, setWeek] = useState(1)
  const [sidebarOpen, setSidebarOpen] = useState(false)
  const [darkMode, setDarkMode] = useState(() => typeof window !== 'undefined' && localStorage.getItem('keltia-theme') === 'dark')
  const [selectedActivity, setSelectedActivity] = useState<Parameters<typeof CourseHub>[0]['activity']>(null)
  const [uiText, setUiText] = useState<UiText>({})
  const [authReady, setAuthReady] = useState(false)
  const [recoveryMode, setRecoveryMode] = useState(false)
  const [displayName, setDisplayName] = useState('')
  const [isAdmin, setIsAdmin] = useState(false)
  const [recapKey, setRecapKey] = useState(0)

  useEffect(() => {
    if (!isSupabaseConfigured) return
    const params = new URLSearchParams(window.location.search)
    const initialize = async () => {
      const tokenHash = params.get('token_hash')
      if (tokenHash) {
        await supabase.auth.verifyOtp({ token_hash: tokenHash, type: 'magiclink' })
        window.history.replaceState({}, '', `/?impersonation=1&session_key=${encodeURIComponent(params.get('session_key') ?? '')}`)
      }
      const { data } = await supabase.auth.getSession()
      setSession(data.session)
      setAuthReady(true)
    }
    void initialize()
    const { data: listener } = supabase.auth.onAuthStateChange((event, nextSession) => {
      setSession(nextSession)
      if (event === 'PASSWORD_RECOVERY') setRecoveryMode(true)
    })
    const onPop = () => setTab(tabFromPath(window.location.pathname))
    window.addEventListener('popstate', onPop)
    return () => {
      listener.subscription.unsubscribe()
      window.removeEventListener('popstate', onPop)
    }
  }, [])

  useEffect(() => { if (isSupabaseConfigured) supabase.from('app_settings').select('setting_key, setting_value').then(({ data }) => setUiText(Object.fromEntries((data ?? []).map((item) => [item.setting_key, item.setting_value])))) }, [])

  useEffect(() => {
    document.documentElement.dataset.theme = darkMode ? 'dark' : 'light'
    localStorage.setItem('keltia-theme', darkMode ? 'dark' : 'light')
  }, [darkMode])

  useEffect(() => {
    if (!session) return
    void (async () => {
      const { data } = await supabase.from('profiles').select('display_name, role, theme, calendar_start_date').eq('id', session.user.id).maybeSingle()
      setDisplayName(data?.display_name ?? '')
      setIsAdmin(data?.role === 'admin' || session.user.email?.toLowerCase() === ADMIN_EMAIL)
      if (data?.theme === 'dark' || data?.theme === 'light') setDarkMode(data.theme === 'dark')
      const settings = await supabase.from('app_settings').select('setting_value').eq('setting_key', 'program_start_date').maybeSingle()
      const start = data?.calendar_start_date ?? settings.data?.setting_value
      if (start) setWeek(programWeekForDate(new Date(start)))
    })()
  }, [session])

  async function handleLogin(event: React.FormEvent) {
    event.preventDefault(); setLoading(true); setAuthError('')
    const { error } = await supabase.auth.signInWithPassword({ email, password })
    if (error) setAuthError(error.message === 'Email not confirmed' ? 'L’adresse email doit être confirmée dans Supabase.' : 'Email ou mot de passe incorrect. Vérifie le compte dans Supabase ou réinitialise le mot de passe.')
    setLoading(false)
  }

  async function handleReset() {
    setAuthError('')
    if (!email) { setAuthError('Saisis ton adresse email avant de demander la réinitialisation.'); return }
    const { error } = await supabase.auth.resetPasswordForEmail(email, { redirectTo: window.location.origin })
    setAuthError(error ? 'Impossible d’envoyer le lien de réinitialisation.' : 'Un lien de réinitialisation a été envoyé si ce compte existe.')
  }

  async function handleLogout() { await supabase.auth.signOut(); setSession(null); setRecoveryMode(false) }
  async function persistTheme(value: boolean) {
    setDarkMode(value)
    if (session) await supabase.from('profiles').update({ theme: value ? 'dark' : 'light' }).eq('id', session.user.id)
  }

  if (!isSupabaseConfigured) return <SetupNotice />
  if (!authReady) return <p className="loading-state">Chargement de la session...</p>
  if (recoveryMode && session) return <RecoveryPage onDone={() => setRecoveryMode(false)} />
  if (!session) return <LoginPageWithText email={email} password={password} setEmail={setEmail} setPassword={setPassword} onSubmit={handleLogin} onReset={() => void handleReset()} error={authError} loading={loading} uiText={uiText} />

  const navigate = (nextTab: Tab) => {
    setTab(nextTab)
    if (nextTab === 'courses') setSelectedActivity(null)
    if (nextTab === 'recap') setRecapKey((value) => value + 1)
    setSidebarOpen(false)
    window.history.pushState({}, '', `${pathForTab(nextTab)}${window.location.search}`)
    window.scrollTo({ top: 0, behavior: 'auto' })
  }
  const openActivity = (activity: NonNullable<Parameters<typeof CourseHub>[0]['activity']>) => {
    setSelectedActivity(activity)
    setTab('courses')
    setSidebarOpen(false)
    window.history.pushState({}, '', `/courses${window.location.search}`)
  }
  const greeting = firstName(displayName || session.user.email?.split('@')[0] || '')
  return <div className={`keltia-app polar-theme ${darkMode ? 'theme-dark' : ''}`}>
    <Sidebar activeTab={tab} isAdmin={isAdmin} email={session.user.email ?? ''} displayName={displayName} open={sidebarOpen} onNavigate={navigate} onClose={() => setSidebarOpen(false)} />
    {sidebarOpen && <button className="sidebar-overlay" onClick={() => setSidebarOpen(false)} aria-label="Fermer le menu" />}
    <div className="app-main"><header className="app-header"><button className="menu-button" onClick={() => setSidebarOpen(true)} aria-label="Ouvrir le menu"><Menu size={21} /></button><div><p className="header-kicker">Espace membre</p><strong>Keltia</strong></div><div className="header-actions">{isAdmin && <NotificationBell />}<button className="avatar-button" onClick={() => void handleLogout()} aria-label="Se déconnecter" title="Se déconnecter"><LogOut size={18} /></button><button className="avatar-button" onClick={() => navigate('settings')} aria-label="Ouvrir les paramètres"><UserRound size={18} /></button></div></header>
      <main className="page-content">
        {tab === 'planning' && <section className="welcome-row"><div><p className="eyebrow">Bonjour{greeting ? `, ${greeting}` : ''}</p><h1>{uiText.welcome_title || 'Votre espace pour progresser.'}</h1><p className="muted">{uiText.welcome_text || 'Un parcours clair pour apprendre, bouger et prendre soin de votre équilibre.'}</p></div><img className="dashboard-mascot" src="/keltia-mascot.jpg" alt="Mascotte Keltia" /></section>}
        {tab === 'planning' && <PlanningV2 week={week} setWeek={setWeek} isAdmin={false} userId={session.user.id} onOpenActivity={openActivity} />}
        {tab === 'courses' && <CourseHub userId={session.user.id} activity={selectedActivity} onSelectCourse={openActivity} onBack={() => navigate('courses')} />}
        {tab === 'recap' && <LanguageRecap key={recapKey} />}
        {tab === 'resources' && <Supports isAdmin={isAdmin} userId={session.user.id} />}
        {tab === 'progress' && <ProgressDashboard userId={session.user.id} />}
        {tab === 'suggestions' && <SuggestionsV2 isAdmin={false} userId={session.user.id} />}
        {tab === 'settings' && <SettingsPanel userId={session.user.id} email={session.user.email ?? ''} isAdmin={isAdmin} displayName={displayName} onDisplayNameChange={setDisplayName} darkMode={darkMode} onDarkModeChange={(value) => void persistTheme(value)} onLogout={() => void handleLogout()} />}
        {tab === 'admin' && isAdmin && <AdminDashboard week={week} setWeek={setWeek} currentUserId={session.user.id} onSaved={setUiText} />}
        {isAdmin && tab !== 'settings' && tab !== 'admin' && <div className="admin-badge"><ShieldCheck size={16} /> Mode administrateur actif</div>}
      </main><footer>KELTIA <span>·</span> espace privé membre</footer></div>
  </div>
}

function KeltiaMark({ large = false }: { large?: boolean }) { return <div className={`keltia-mark ${large ? 'large' : ''}`}><img src="/keltia-logo.png" alt="Logo Keltia" /><div><strong>Keltia</strong><small>espace membre</small></div></div> }
function Sidebar({ activeTab, isAdmin, email, displayName, open, onNavigate, onClose }: { activeTab: Tab; isAdmin: boolean; email: string; displayName: string; open: boolean; onNavigate: (tab: Tab) => void; onClose: () => void }) {
  const items: { tab: Tab; label: string; caption: string; icon: React.ReactNode }[] = [
    { tab: 'planning', label: 'Tableau de bord', caption: 'Plannings', icon: <LayoutDashboard size={18} /> },
    { tab: 'courses', label: 'Plan & Plate', caption: 'Cours et modules', icon: <BookOpen size={18} /> },
    { tab: 'recap', label: 'Récap', caption: 'Révisions par langue', icon: <Languages size={18} /> },
    { tab: 'progress', label: 'Progress', caption: 'Vos progrès', icon: <Activity size={18} /> },
    { tab: 'resources', label: 'Supports', caption: 'Fichiers et documents', icon: <FolderOpen size={18} /> },
    { tab: 'suggestions', label: 'Idées', caption: 'Faire évoluer Keltia', icon: <MessageSquarePlus size={18} /> },
    ...(isAdmin ? [{ tab: 'admin' as const, label: 'Administration', caption: 'Gestion et simulation', icon: <ShieldCheck size={18} /> }] : []),
  ]
  const label = displayName || email.split('@')[0] || 'Membre'
  return <aside className={`sidebar ${open ? 'is-open' : ''}`}><div className="sidebar-top"><KeltiaMark /><button className="sidebar-close" onClick={onClose} aria-label="Fermer le menu"><X size={19} /></button></div><div className="sidebar-label">Navigation</div><nav className="sidebar-nav" aria-label="Navigation principale">{items.map((item, index) => <button className={`sidebar-link ${activeTab === item.tab ? 'active' : ''}`} key={`${item.label}-${index}`} onClick={() => onNavigate(item.tab)}>{item.icon}<span><strong>{item.label}</strong><small>{item.caption}</small></span></button>)}</nav><div className="sidebar-bottom"><button className={`sidebar-link ${activeTab === 'settings' ? 'active' : ''}`} onClick={() => onNavigate('settings')}><Settings size={18} /><span><strong>Paramètres</strong><small>Compte et préférences</small></span></button><div className="sidebar-user"><span className="user-avatar">{label.slice(0, 1).toUpperCase() || 'K'}</span><span><strong>{label}</strong><small>{isAdmin ? 'Administrateur' : 'Membre'}</small></span></div></div></aside>
}
function SettingsPanel({ userId, email, isAdmin, displayName, onDisplayNameChange, darkMode, onDarkModeChange, onLogout }: { userId: string; email: string; isAdmin: boolean; displayName: string; onDisplayNameChange: (value: string) => void; darkMode: boolean; onDarkModeChange: (value: boolean) => void; onLogout: () => void }) {
  const [nameDraft, setNameDraft] = useState(displayName)
  const [newPassword, setNewPassword] = useState('')
  const [profileMessage, setProfileMessage] = useState('')
  const [passwordMessage, setPasswordMessage] = useState('')
  const [saving, setSaving] = useState(false)
  useEffect(() => { setNameDraft(displayName) }, [displayName])
  async function saveDisplayName(event: React.FormEvent) {
    event.preventDefault(); setSaving(true); setProfileMessage('')
    const { error } = await supabase.from('profiles').update({ display_name: nameDraft.trim() || null }).eq('id', userId)
    if (!error) onDisplayNameChange(nameDraft.trim())
    setProfileMessage(error ? 'Impossible d’enregistrer le nom d’utilisateur.' : 'Nom d’utilisateur enregistré.')
    setSaving(false)
  }
  async function changePassword(event: React.FormEvent) {
    event.preventDefault(); setPasswordMessage('')
    if (newPassword.length < 6) { setPasswordMessage('Le mot de passe doit contenir au moins 6 caractères.'); return }
    const { error } = await supabase.auth.updateUser({ password: newPassword })
    setPasswordMessage(error ? 'Impossible de modifier le mot de passe.' : 'Mot de passe modifié.')
    if (!error) setNewPassword('')
  }
  return <section className="settings-page"><div className="section-intro"><p className="eyebrow">Votre compte</p><h2>Paramètres</h2><p className="muted">Gérez votre profil et les préférences de votre espace Keltia.</p></div><div className="settings-grid"><article className="settings-card profile-card"><div className="profile-avatar">{(displayName || email).slice(0, 1).toUpperCase() || 'K'}</div><div><p className="card-kicker">Profil</p><h3>{displayName || email.split('@')[0] || 'Membre Keltia'}</h3><p className="muted">{email}</p><span className="role-pill">{isAdmin ? 'Administrateur' : 'Membre'}</span></div></article><article className="settings-card" style={{ flexDirection: 'column', alignItems: 'stretch' }}><form onSubmit={(event) => void saveDisplayName(event)} style={{ display: 'grid', gap: 10 }}><label>Nom d’utilisateur<input value={nameDraft} onChange={(event) => setNameDraft(event.target.value)} placeholder="Votre nom affiché" maxLength={60} /></label><button className="primary-button" type="submit" disabled={saving}>Enregistrer le nom</button>{profileMessage && <p className="form-feedback">{profileMessage}</p>}</form></article><article className="settings-card" style={{ flexDirection: 'column', alignItems: 'stretch' }}><form onSubmit={(event) => void changePassword(event)} style={{ display: 'grid', gap: 10 }}><label>Nouveau mot de passe<input type="password" value={newPassword} onChange={(event) => setNewPassword(event.target.value)} placeholder="Au moins 6 caractères" autoComplete="new-password" /></label><button className="primary-button" type="submit">Modifier le mot de passe</button>{passwordMessage && <p className="form-feedback">{passwordMessage}</p>}</form></article><article className="settings-card"><div className="setting-row"><span className="setting-icon"><Moon size={18} /></span><span><strong>Apparence sombre</strong><small>Adapter l’affichage à votre environnement</small></span><button className={`toggle ${darkMode ? 'on' : ''}`} onClick={() => onDarkModeChange(!darkMode)} aria-label="Activer ou désactiver le mode sombre" aria-pressed={darkMode}><span /></button></div><div className="setting-row"><span className="setting-icon"><Sun size={18} /></span><span><strong>Thème actuel</strong><small>{darkMode ? 'Sombre' : 'Clair'}</small></span></div></article><article className="settings-card danger-card"><div><p className="card-kicker">Session</p><h3>Quitter Keltia</h3><p className="muted">Vous pourrez vous reconnecter à tout moment avec votre adresse email.</p></div><button className="logout-button" onClick={onLogout}><LogOut size={16} /> Se déconnecter</button></article></div></section>
}
function RecoveryPage({ onDone }: { onDone: () => void }) {
  const [password, setPassword] = useState('')
  const [message, setMessage] = useState('')
  const [saving, setSaving] = useState(false)
  async function submit(event: React.FormEvent) {
    event.preventDefault()
    if (password.length < 6) { setMessage('Le mot de passe doit contenir au moins 6 caractères.'); return }
    setSaving(true)
    const { error } = await supabase.auth.updateUser({ password })
    setSaving(false)
    if (error) { setMessage('Impossible d’enregistrer le nouveau mot de passe.'); return }
    onDone()
  }
  return <div className="login-page polar-login"><div className="login-art"><KeltiaMark large /><p className="eyebrow">SÉCURITÉ</p><h1>Choisissez un nouveau mot de passe.</h1><p>Après validation, vous retrouverez votre espace membre.</p></div><form className="login-card" onSubmit={(event) => void submit(event)}><KeltiaMark large /><h2>Réinitialisation</h2><p className="muted">Saisissez un mot de passe d’au moins 6 caractères.</p><label>Nouveau mot de passe<input type="password" value={password} onChange={(event) => setPassword(event.target.value)} required autoComplete="new-password" /></label>{message && <p className="form-error">{message}</p>}<button className="primary-button" disabled={saving}>{saving ? 'Enregistrement...' : 'Enregistrer'}</button></form></div>
}
function LoginPageWithText({ uiText, ...props }: LoginProps & { uiText: UiText }) { return <div className="login-page polar-login"><div className="login-art"><KeltiaMark large /><p className="eyebrow">VOTRE ESPACE PERSONNEL</p><h1>{uiText.login_hero_title || 'Un rythme qui vous ressemble.'}</h1><p>{uiText.login_hero_text || 'Langues, mouvement et nutrition réunis dans un espace simple, calme et privé.'}</p></div><form className="login-card" onSubmit={props.onSubmit}><KeltiaMark large /><h2>{uiText.login_title || 'Bienvenue.'}</h2><p className="muted">{uiText.login_text || 'Connectez-vous pour retrouver votre parcours.'}</p><label>Email<input type="email" value={props.email} onChange={(event) => props.setEmail(event.target.value)} required autoComplete="email" /></label><label>Mot de passe<input type="password" value={props.password} onChange={(event) => props.setPassword(event.target.value)} required autoComplete="current-password" /></label>{props.error && <p className="form-error">{props.error}</p>}<button className="primary-button" disabled={props.loading}>{props.loading ? 'Connexion...' : uiText.login_button || 'Ouvrir mon espace'}</button><button className="reset-button" type="button" onClick={props.onReset}>Mot de passe oublié ?</button></form></div> }
function SetupNotice() { return <div className="setup-page"><div className="setup-card"><KeltiaMark large /><h1>La base de données attend ses clés.</h1><p className="muted">Créez un fichier <code>.env.local</code> à la racine avec <code>VITE_SUPABASE_URL</code> et <code>VITE_SUPABASE_ANON_KEY</code>, puis relancez le serveur.</p><div className="code-block">VITE_SUPABASE_URL=https://...supabase.co<br />VITE_SUPABASE_ANON_KEY=...</div></div></div> }

export default App
