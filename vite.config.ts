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
    includeAssets: ['**/*.{pdf,xlsx,png}'],
    manifest: {
      name: 'Keltia - Espace membre',
      short_name: 'Keltia',
      description: 'Espace privé de langues, sport et nutrition.',
      theme_color: '#1f4d43',
      background_color: '#f6f4ef',
      display: 'standalone',
      lang: 'fr',
      icons: [
        { src: '/keltia-icon-192.png', sizes: '192x192', type: 'image/png', purpose: 'any maskable' },
        { src: '/keltia-icon-512.png', sizes: '512x512', type: 'image/png', purpose: 'any maskable' },
      ],
    },
  })],
})
