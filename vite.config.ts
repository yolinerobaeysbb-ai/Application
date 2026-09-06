import react from '@vitejs/plugin-react'
import { defineConfig } from 'vite'
import { VitePWA } from 'vite-plugin-pwa'

// https://vite.dev/config/
export default defineConfig({
  server: {
    host: true,
  },
  plugins: [react(), VitePWA({
    registerType: 'autoUpdate',
    includeAssets: ['**/*.{pdf,xlsx}'],
    manifest: {
      name: 'Phoenix - Parcours personnel',
      short_name: 'Phoenix',
      description: 'Parcours privé de langues, sport et nutrition sur 16 semaines.',
      theme_color: '#254e45',
      background_color: '#f1f1ec',
      display: 'standalone',
      lang: 'fr',
      icons: [],
    },
  })],
})
