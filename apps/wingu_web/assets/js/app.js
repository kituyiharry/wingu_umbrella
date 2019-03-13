// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.css"
import "vuetify/dist/vuetify.min.css"
import "aos/dist/aos.css"
import "material-design-icons/iconfont/material-icons.css"

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
import VueApollo from 'vue-apollo'
import { ApolloClient } from 'apollo-client'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { createHttpLink } from 'apollo-link-http'
import AOS from 'aos'

import App from './vue/App.vue'
import Landing from './vue/routes/landing/Landing.vue'

const routes = [
  {path: '/', component: Landing}
]
const router = new VueRouter({
  routes
})
const httpLink = new createHttpLink({
  uri: '/graphql'
})
const apolloClient = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache(),
  connectToDevtools: true
})
const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
  //defaultOptions...
})


AOS.init({
  once: true, // whether animation should happen only once - while scrolling down
});

Vue.$httpLink = Vue.prototype.$httpLink = httpLink
Vue.$AOS = Vue.prototype.$AOS = AOS
Vue.use(Vuetify)
Vue.use(VueRouter)
Vue.use(VueApollo)

new Vue({
  el: '#sahihi',
  apolloProvider: apolloProvider,
  components: { App },
  router,
  template: '<App />'
})
