import { useEffect, useState } from 'react'
import { Save } from 'lucide-react'
import { supabase } from './lib/supabase'

type Settings = Record<string, string>
const fields: { key: string; label: string; description: string }[] = [
  { key: 'brand_name', label: 'Nom de l’application', description: 'Nom affiché dans l’espace et la connexion.' },
  { key: 'welcome_title', label: 'Titre de l’accueil', description: 'Grand titre visible après connexion.' },
  { key: 'welcome_text', label: 'Texte de l’accueil', description: 'Phrase sous le titre principal.' },
  { key: 'login_hero_title', label: 'Titre de connexion', description: 'Titre de la partie gauche de la connexion.' },
  { key: 'login_hero_text', label: 'Texte de connexion', description: 'Texte de présentation de la connexion.' },
  { key: 'login_title', label: 'Titre du formulaire', description: 'Titre au-dessus du formulaire email.' },
  { key: 'login_text', label: 'Introduction du formulaire', description: 'Texte sous le titre du formulaire.' },
  { key: 'login_button', label: 'Bouton de connexion', description: 'Libellé du bouton principal.' },
]
export default function AdminUiSettingsManager({ onSaved }: { onSaved: (settings: Settings) => void }) {
  const [values, setValues] = useState<Settings>({})
  const [message, setMessage] = useState('')
  useEffect(() => { supabase.from('app_settings').select('setting_key, setting_value').then(({ data }) => setValues(Object.fromEntries((data ?? []).map((item) => [item.setting_key, item.setting_value])))) }, [])
  async function save() { const result = await supabase.from('app_settings').upsert(fields.map((field) => ({ setting_key: field.key, setting_value: values[field.key] ?? '' }))); setMessage(result.error ? result.error.message : 'Textes enregistrés.'); if (!result.error) onSaved(values) }
  return <article className="settings-card settings-copy-editor"><div><p className="card-kicker">Administration</p><h3>Modifier les textes de l’application</h3><p className="muted">Les textes de l’accueil et de la connexion peuvent être adaptés sans modifier le code.</p></div><div className="settings-copy-fields">{fields.map((field) => <label key={field.key}>{field.label}<small>{field.description}</small><textarea rows={2} value={values[field.key] ?? ''} onChange={(event) => setValues((current) => ({ ...current, [field.key]: event.target.value }))} /></label>)}</div><button className="primary-button" type="button" onClick={() => void save()}><Save size={15} /> Enregistrer les textes</button>{message && <p className="form-feedback">{message}</p>}</article>
}
