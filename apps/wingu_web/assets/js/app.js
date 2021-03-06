// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.css"
import "vuetify/dist/vuetify.min.css"
import "aos/dist/aos.css"
import "material-design-icons/iconfont/material-icons.css"
import "vuetify/es5/util/colors"
import "vis/dist/vis.css"

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
import moment from 'moment'
import vis from 'vis'

import App from './vue/App.vue'
import Landing from './vue/routes/landing/Landing.vue'
import Home from './vue/routes/home/Home.vue'
import Index from './vue/routes/home/subroutes/Index.vue'
import CompanyView from './vue/routes/home/subroutes/CompanyView.vue'
import SubIndex from './vue/routes/home/subroutes/company_routes/Index.vue'
import Integrations from './vue/routes/home/subroutes/company_routes/Integrations.vue'
import Records   from './vue/routes/home/subroutes/company_routes/Records.vue'
import Stats from './vue/routes/home/subroutes/company_routes/Stats.vue'
import FormWizard from './vue/routes/home/subroutes/company_routes/components/FormWizard.vue'
import DocGroups from './vue/routes/home/subroutes/company_routes/components/DocGroups.vue'
import Settings from './vue/routes/home/subroutes/SettingsView.vue'

import Store from './vue/store/store.js'

const routes = [
  {path: '/', component: Landing},
  {path: '/home', component: Home, children: [
    {path: '/', component: Index},
    {path: '/user', component: Settings},
    {path: '/b/:id', component: CompanyView,  children: [
      {path: '/', component: SubIndex},
      {path: '/i/overview', component: SubIndex},
      {path: '/i/profile', component:  DocGroups},
      {path: '/i/perms', component: Records},
      {path: '/records/groups', component: Integrations},
      {path: '/records/view', component: Records},
      {path: '/records/edit', component: FormWizard },
      {path: '/events/up', component: Records},
      {path: '/events/tickets', component: Integrations},
      {path: '/money/finance', component: Records},
      {path: '/money/stats', component: Stats},
      //{path: '/forms/:docclass/c/:company', component: Forms},
    ]},
  ]},
]

const router = new VueRouter({
  //base: '/',
  routes,
  scrollBehavior (to ) {
    //return { x: 0, y: 0 }
    return to.fullPath == "/home" ? new Promise((resolve) => {
      setTimeout(() => {
        resolve({ x: 0, y: 0 })
      }, 200) 
    }) : {x:0, y:0}
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
Vue.$moment = Vue.prototype.$moment = moment 
Vue.$vis = Vue.prototype.$vis = vis

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
