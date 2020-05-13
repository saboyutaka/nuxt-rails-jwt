require('dotenv').config();

export default {
  mode: 'universal',
  head: {
    title: process.env.npm_package_name || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: process.env.npm_package_description || '' },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
  },
  loading: { color: '#fff' },
  css: [],
  plugins: [],
  buildModules: [
    //
    '@nuxtjs/dotenv',
    '@nuxtjs/tailwindcss',
  ],
  modules: [
    //
    '@nuxtjs/axios',
    '@nuxtjs/auth',
  ],
  build: {
    extend(config, ctx) {},
  },
  router: {
    middleware: ['auth'],
  },
  axios: {
    baseURL: process.env.BACKEND_API_URL,
  },
  auth: {
    strategies: {
      local: {
        endpoints: {
          login: { url: '/auth/login', method: 'post', propertyName: 'token' },
          user: { url: '/auth/user' },
          logout: false,
        },
      },
    },
  },
  redirect: {
    login: '/login',
    logout: '/login',
    home: '/',
  },
};
