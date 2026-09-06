# Phoenix

Application privée mobile-first pour les langues, le sport et la nutrition.

## Développement local

```bash
npm install
npm run dev
```

## Déploiement public

`localhost` ne fonctionne que sur l'ordinateur qui exécute Vite. Pour permettre aux utilisateurs en France et ailleurs d'accéder à l'application, déployer le projet sur Vercel :

1. Importer le dépôt dans Vercel.
2. Utiliser `npm run build` comme commande de build.
3. Utiliser `dist` comme dossier de sortie.
4. Ajouter les variables d'environnement du fichier `.env.example` : `VITE_SUPABASE_URL` et `VITE_SUPABASE_ANON_KEY`.
5. Ouvrir l'URL HTTPS fournie par Vercel.

Le fichier `vercel.json` conserve le fonctionnement de l'application React lors de l'ouverture directe d'une route.

Après le premier déploiement, ajouter l'URL Vercel dans Supabase, dans **Authentication > URL Configuration** :

- **Site URL** : l'URL publique Vercel
- **Redirect URLs** : l'URL publique Vercel, avec `/**` si nécessaire

Les utilisateurs pourront alors ouvrir la même URL depuis la France, le Canada ou un téléphone, sans que ton ordinateur reste allumé.

This template provides a minimal setup to get React working in Vite with HMR and some Oxlint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react) uses [Oxc](https://oxc.rs)
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react-swc) uses [SWC](https://swc.rs/)

## React Compiler

The React Compiler is not enabled on this template because of its impact on dev & build performances. To add it, see [this documentation](https://react.dev/learn/react-compiler/installation).

## Expanding the Oxlint configuration

If you are developing a production application, we recommend enabling type-aware lint rules by installing `oxlint-tsgolint` and editing `.oxlintrc.json`:

```json
{
  "$schema": "./node_modules/oxlint/configuration_schema.json",
  "plugins": ["react", "typescript", "oxc"],
  "options": {
    "typeAware": true
  },
  "rules": {
    "react/rules-of-hooks": "error",
    "react/only-export-components": ["warn", { "allowConstantExport": true }]
  }
}
```

See the [Oxlint rules documentation](https://oxc.rs/docs/guide/usage/linter/rules) for the full list of rules and categories.
