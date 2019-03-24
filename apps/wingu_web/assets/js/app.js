// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.css"
import "vuetify/dist/vuetify.min.css"
import "aos/dist/aos.css"
import "material-design-icons/iconfont/material-icons.css"
import "vuetify/es5/util/colors"

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
import Vuex from 'vuex'
import { ApolloClient } from 'apollo-client'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { createHttpLink } from 'apollo-link-http'
import AOS from 'aos'

import App from './vue/App.vue'
import Landing from './vue/routes/landing/Landing.vue'
import Home from './vue/routes/home/Home.vue'
import Index from './vue/routes/home/subroutes/Index.vue'
import CompanyView from './vue/routes/home/subroutes/CompanyView.vue'
import Dashboard from './vue/routes/home/subroutes/company_routes/Dashboard.vue'

import Store from './vue/store/store.js'

const routes = [
  {path: '/', component: Landing},
  {path: '/home', component: Home, children: [
    {path: '/', component: Index},
    {path: '/b/:id', component: CompanyView, children: [
      {path: '/', component: Dashboard},
    ]},
  ]},
]
const router = new VueRouter({
  //base: '/',
  routes,
  scrollBehavior () {
    //return { x: 0, y: 0 }
    return new Promise((resolve) => {
    setTimeout(() => {
      resolve({ x: 0, y: 0 })
    }, 200)
  })
  }
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
Vue.use(Vuetify, {
  theme: {
    primary: "#996fd6",
    secondary: "#F08000"
  }
})
Vue.use(VueRouter)
Vue.use(VueApollo)
Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    store: Store
  }
})
new Vue({
  //el: '#sahihi',
  apolloProvider: apolloProvider,
  components: { App },
  router,
  store,
  template: '<App />'
}).$mount('#sahihi')
