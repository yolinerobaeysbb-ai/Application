# Keltia

Espace membre privé (langues, sport, nutrition), pensé mobile-first.

## Développement local

```bash
npm install
npm run dev
```

Créez `.env.local` à partir de `.env.example` avec `VITE_SUPABASE_URL` et `VITE_SUPABASE_ANON_KEY`.

Les migrations SQL sont dans `supabase/migrations/`. Après un `git pull`, appliquez les nouvelles migrations sur le projet Supabase lié (`supabase db push` ou le SQL Editor).

## Déploiement (GitHub → Vercel)

1. Pousser le dépôt sur GitHub.
2. Importer le dépôt dans Vercel (`npm run build`, dossier `dist`).
3. Ajouter les variables d’environnement `VITE_SUPABASE_URL` et `VITE_SUPABASE_ANON_KEY`.
4. Dans Supabase → Authentication → URL Configuration :
   - **Site URL** : l’URL Vercel
   - **Redirect URLs** : l’URL Vercel (avec `/**` si besoin)

`vercel.json` redirige toutes les routes vers l’application React (`/calendar`, `/courses`, etc.).

## Fonctions Edge

Le flux Google Calendar (`calendar-feed`) et l’impersonation admin se déploient avec :

```bash
supabase functions deploy calendar-feed
supabase functions deploy admin-start-impersonation
```

Le tableau de bord regroupe les plannings de cours, sport, repas et activités fixes. Il permet de régler la date de début du programme, de repérer les créneaux libres et d’abonner Google Calendar au planning complet via le flux personnel.
