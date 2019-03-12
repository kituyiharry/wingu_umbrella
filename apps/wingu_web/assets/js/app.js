// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.css"
import "vuetify/dist/vuetify.min.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import Vue from 'vue'
import Vuetify from 'vuetify'
import VueRouter from 'vue-router'

import App from './vue/App.vue'
import Landing from './vue/routes/landing/Landing.vue'

const routes = [
  {path: '/', component: Landing}
]

const router = new VueRouter({
  routes
})

Vue.use(Vuetify)
Vue.use(VueRouter)
/* eslint-disable no-new */
new Vue({
  el: '#sahihi',
  components: { App },
  router,
  template: '<App />'
})
