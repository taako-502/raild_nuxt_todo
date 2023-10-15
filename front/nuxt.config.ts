export default defineNuxtConfig({
  // Disable server-side rendering (https://nuxt.com/docs/api/configuration/nuxt-config#ssr)
  ssr: false,

  // Global page headers (https://nuxt.com/docs/api/configuration/nuxt-config#head)
  app: {
    head: {
      title: "sample_app",
      htmlAttrs: {
        lang: "en",
      },
      meta: [
        { charset: "utf-8" },
        { name: "viewport", content: "width=device-width, initial-scale=1" },
        { hid: "description", name: "description", content: "" },
        { name: "format-detection", content: "telephone=no" },
      ],
      link: [{ rel: "icon", type: "image/x-icon", href: "/favicon.ico" }],
    },
  },

  // Global CSS (https://nuxt.com/docs/api/configuration/nuxt-config#css)
  css: [],

  // Plugins (https://nuxt.com/docs/api/configuration/nuxt-config#plugins)
  plugins: [],
});
