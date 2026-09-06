import { useEffect, useState } from 'react'
import { Bell, Check, LoaderCircle } from 'lucide-react'
import { supabase } from './lib/supabase'

type Notification = { id: string; type: 'new_suggestion' | 'placement_test_completed'; title: string; message: string; read_at: string | null; created_at: string }

export default function NotificationBell() {
  const [notifications, setNotifications] = useState<Notification[]>([])
  const [open, setOpen] = useState(false)
  const [loading, setLoading] = useState(true)

  async function loadNotifications() {
    const { data } = await supabase.from('admin_notifications').select('id, type, title, message, read_at, created_at').order('created_at', { ascending: false }).limit(20)
    setNotifications((data ?? []) as Notification[])
    setLoading(false)
  }

  useEffect(() => {
    void loadNotifications()
    const channel = supabase.channel('admin-notifications').on('postgres_changes', { event: 'INSERT', schema: 'public', table: 'admin_notifications' }, (payload) => {
      setNotifications((current) => [payload.new as Notification, ...current].slice(0, 20))
    }).subscribe()
    return () => { void supabase.removeChannel(channel) }
  }, [])

  async function markRead(id: string) {
    await supabase.from('admin_notifications').update({ read_at: new Date().toISOString() }).eq('id', id)
    setNotifications((current) => current.map((notification) => notification.id === id ? { ...notification, read_at: new Date().toISOString() } : notification))
  }

  const unread = notifications.filter((notification) => !notification.read_at).length
  return <div className="notification-wrap"><button className="notification-button" onClick={() => setOpen(!open)} aria-label="Ouvrir les notifications" aria-expanded={open}><Bell size={19} />{unread > 0 && <span className="notification-count">{unread > 9 ? '9+' : unread}</span>}</button>{open && <div className="notification-panel"><div className="notification-heading"><div><p className="card-kicker">Administration</p><h3>Notifications</h3></div>{unread > 0 && <span>{unread} non lue{unread > 1 ? 's' : ''}</span>}</div>{loading ? <p className="notification-empty"><LoaderCircle size={16} className="spin" /> Chargement...</p> : notifications.length ? <div className="notification-list">{notifications.map((notification) => <article className={`notification-item ${notification.read_at ? 'read' : ''}`} key={notification.id}><div><strong>{notification.title}</strong><p>{notification.message}</p><small>{new Date(notification.created_at).toLocaleString('fr-FR', { dateStyle: 'short', timeStyle: 'short' })}</small></div>{!notification.read_at && <button className="notification-read" onClick={() => void markRead(notification.id)} aria-label="Marquer comme lue" title="Marquer comme lue"><Check size={15} /></button>}</article>)}</div> : <p className="notification-empty">Aucune notification récente.</p>}</div>}</div>
}
