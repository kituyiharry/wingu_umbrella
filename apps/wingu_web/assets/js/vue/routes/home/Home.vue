<template>
  <v-app :dark='dark' style='font-family: "Montserrat", sans-serif;'> 
    <v-toolbar app dense 
      height='80'
      class="elevation-0" dark color="primary">
      <v-btn outline data-aos='zoom-in' data-aos-delay='100' icon @click='$router.go(-1)'>
        <v-icon small>
          arrow_back
        </v-icon>
      </v-btn>
      <v-toolbar-title>
        <v-layout column>
          <div style='text-overflow: scroll; font-family: Pacifico;font-weight: normal;font-size: 24px;'>
            <strong>{{ $store.state.store.home | first }}</strong>
          </div>
          <v-divider />
          <v-divider />
          <span style='font-size: 12px;'>Dashboard</span>
        </v-layout>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-menu
        attach='#chat' 
        transition='slide-y-reverse-transition' 
        nudge-left='170'
        nudge-bottom='4'
        open-on-hover close-on-content-click offset-y>
        <div id='chat' slot='activator'>
          <v-btn id='chat' outline data-aos='zoom-in' data-aos-delay='200' icon round flat>
            <v-badge color='red'>
              <span style='font-size: 12px;' slot='badge'>23</span>
              <v-icon small>
                chat
              </v-icon>
            </v-badge>
          </v-btn>
        </div>
        <div class='up-arrow'>
        </div>
        <v-card style='border-radius: 8px;' width='230' height='200'>
        </v-card>
      </v-menu>
      <v-menu 
        attach='#bell' 
        transition='slide-y-reverse-transition' 
        nudge-left='170'
        nudge-bottom='4'
        open-on-hover close-on-content-click offset-y>
        <div id='bell' slot='activator' class='mr-2'>
          <v-btn  outline data-aos='zoom-in' data-aos-delay='300' icon round flat>
            <v-badge color='red'>
              <span slot='badge' style='font-size: 12px;'>6</span>
              <v-icon small>
                notifications_none
              </v-icon>
            </v-badge>
          </v-btn>
        </div>
        <div class='up-arrow'>
        </div>
        <v-card style='border-radius: 8px;' width='230' height='200'>
        </v-card>
      </v-menu>
      <v-menu
        attach='#profile' 
        transition='slide-y-reverse-transition' 
        nudge-left='180'
        nudge-bottom='3'
        open-on-click :close-on-click='false'
        open-on-hover offset-y>
        <span slot='activator' id='profile'>
          <v-avatar>
            <v-img
              v-if='$apollo.queries.client.loading!=undefined && $store.state.store.client.picture != undefined'
              :lazy-src="$store.state.store.client.picture"
              :src="$store.state.store.client.picture"
              >
              <template v-slot:placeholder>
                <v-layout
                  fill-height
                  align-center
                  justify-center
                  ma-0>
                  <v-progress-circular indeterminate color="orange"></v-progress-circular>
                </v-layout>
              </template>
            </v-img>
            <v-icon v-else small>
              broken_image
            </v-icon>
          </v-avatar>
        </span>
        <div class='correct-up-arrow'>
        </div>
        <v-card style='border-radius: 8px;' width='230' height='200'>
          <v-card-title>
            <v-switch v-model='dark'></v-switch>
          </v-card-title>
        </v-card>
      </v-menu>
    </v-toolbar>
    <!--<transition name='slide-fade'>-->
      <router-view ></router-view>
      <!--</transition>-->
    <v-snackbar
      v-model="snackbar"
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
export default {
  name: 'Home',
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
  filters: {
    first(sentence){
      return sentence.split(" ")[0]
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
