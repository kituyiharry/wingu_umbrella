<template>
  <v-app :dark='dark' style='font-family: "Montserrat", sans-serif;'> 
    <transition name='slide-left' mode='out-in'>
      <router-view ></router-view>
      </transition>
    <v-snackbar
      color='error'
      class='white--text'
      bottom
      >
      {{ error }}
      <v-btn
        color="pink"
        flat
        @click="snackbar = false"
        >
        Close
      </v-btn>
    </v-snackbar>
  </v-app>
</template>
<script charset="utf-8">
import { CLIENT, COMPANIES } from '../../graphql/queries.js'
//import Settings from './subroutes/SettingsView.vue';
export default {
  name: 'Home',
  //components: { Settings },
  mounted(){
    // this.$apollo.queries.client.start()
    if (/localhost/i.test(window.location)) {
      this.$apollo.queries.client.start()
      this.$apollo.queries.my_companies.start()
    } else {
      this.error =  "Some functions may not work when not in localhost"
      this.snackbar = true
    }
  },
  watch: {
    $route(to){
      if(to.path=="/home"){
        this.$store.commit("mutateTitle","Home");
      }
    }
  },
  data: () => ({
    links: [
      'Home',
      'About Us',
      'Team',
      'Services',
      'Blog',
      'Contact Us'
    ],
    drawer: false,
    title: "Home",
    dark: false,
    snackbar: false,
    error: "",
    offsetTop: 0,
    scroll: 0,
  }),
  methods: {
    log(){
      //console.dir(d)
    }
  },
  apollo:{
    client: {
      skip: true,
      query: CLIENT,
      update (data) {
        this.$store.dispatch("prepareClient", data.client)
      },
      error (error){
        this.error = error
        this.snackbar = true
        alert(error)
      }
    },
    my_companies: {
      skip: true,
      query: COMPANIES,
      update (data) {
        this.$store.dispatch("prepareCompanies", data.myCompanies)
      },
    }
  }
}
</script>
<style type="text/css" media="screen">
.v-toolbar__content{
  max-width: 1366px;
  margin: auto;
}
.v-menu__content{
  box-shadow: 0 5px 5px -3px rgba(0,0,0,.2), 0 8px 10px 1px rgba(0,0,0,0.12), 0 3px 14px 2px rgba(0,0,0,0);
}
.up-arrow{
  border-style: solid;
  border-width: 0px 7px 7px 7px;
  margin-left: 186px;
  height: 0px;
  width: 0px;
}
.theme--light > .up-arrow{
  border-color: white transparent;
}
.theme--dark> .up-arrow{
  border-color: #3b3b3b transparent;
}
.correct-up-arrow{
  border-style: solid;
  border-width: 0px 7px 7px 7px;
  margin-left: 200px;
  height: 0px;
  width: 0px;
}
.theme--light > .correct-up-arrow{
  border-color: white transparent;
}
.theme--dark > .correct-up-arrow{
  border-color: #3b3b3b transparent;
}
.v-card--hover{
  border-radius: 8px;
  background-color: #61045fff;
  background-image: linear-gradient(to bottom, #AA076BFF, #61045F00);
}
.v-card--hover:hover{
  background-color: #aa076bff;
  transform: translateY(-8.5px);
}
</style>
