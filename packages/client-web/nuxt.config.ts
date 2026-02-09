// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: {
    enabled: true,

    timeline: {
      enabled: true,
    },
  },

  modules: [
    '@nuxt/image',
    '@nuxt/ui',
    '@nuxtjs/tailwindcss',
    '@pinia/nuxt',
    'nuxt-icon',
    'nuxt-headlessui',
    'dayjs-nuxt',
    '@sidebase/nuxt-auth',
    '@nuxtjs/i18n',
  ],

  runtimeConfig: {
    public: {
      baseUrl: process.env.BASE_URL || 'http://localhost:3000',
      api: {
        baseUrl: process.env.API_BASE_URL || 'http://localhost:3000',
      },
    }
  },

  tailwindcss: {
    cssPath: '~/assets/scss/app.scss',
  },

  ui: {
    icons: ['material-symbols-light', 'majesticons', 'ph', 'mingcute']
  },

  auth: {
    provider: {
      type: 'authjs'
    }
  },

  i18n: {
    locales: ['en', 'id'],
    defaultLocale: 'en',
    strategy: 'prefix_and_default',
  }
})
