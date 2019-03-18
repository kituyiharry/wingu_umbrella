<template>
  <v-app style='font-family: "Montserrat", sans-serif;'> 
    <v-navigation-drawer app v-model='drawer'>
      <v-card flat tile height='250' color='primary'>
      </v-card>
    </v-navigation-drawer>
    <v-toolbar app height='80' dark color='primary' class='elevation-1'>
      <v-toolbar-side-icon @click='drawer=!drawer'/>
      <v-btn flat round outline>
        <v-icon small left>
          business_center
        </v-icon>
        connect
      </v-btn>
      <v-spacer></v-spacer>
      <v-avatar>
        <v-img
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
      </v-avatar>
    </v-toolbar>
    <v-content>
      <v-card dark style='height: 88vh' color='primary' flat tile>
          <!--:height='$vuetify.breakpoint.lgAndUp ? 500 : 500'-->
        <v-img
          style='height:88vh;'
          src='/images/biz.jpg'
          lazy-src='/images/biz.jpg'
          gradient="to bottom right, rgba(0,0,0,.1), rgba(0,0,0, .7), rgba(0,0,0,1)"
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
          <!--<v-container fluid>-->
            <v-layout row wrap fill-height d-flex align-center justify-content-center>
              <v-flex xs12 md6 lg6 class='pa-3'>
                <h1 data-aos='fade' class='text-xs-center mx-5' style='font-size:3.26em;'> 
                  Get up to scale
                </h1>
                <h3 data-aos='fade' data-aos-delay='200' class='text-xs-center mx-3'>
                  Short stuff here describing this action in depth
                </h3>
                <span data-aos='flip-left' data-aos-delay='250' 
                  style='display:flex; align-items:center; justify-content: center'
                  class='mt-5'>
                  <v-btn @click='thedialog=!thedialog' color='deep-orange' round >
                    <v-icon left>
                      group_add
                    </v-icon>
                    <strong>
                      register
                    </strong>
                  </v-btn>
                </span>
              </v-flex>
              <v-flex v-if='$vuetify.breakpoint.mdAndUp' xs12 md6 lg6 d-flex>
                <HomeCard />
              </v-flex>
            </v-layout>
            <!--</v-container>-->
        </v-img>
      </v-card>
    </v-content>
    <v-dialog transition='slide-y-reverse-transition' v-model='thedialog' :fullscreen='$vuetify.breakpoint.mdAndDown'>
      <HomeCard />
    </v-dialog>
  </v-app>
</template>
<script charset="utf-8">
import { CLIENT } from '../../graphql/queries.js'
import HomeCard from './components/HomeCard.vue'
export default {
  name: 'Home',
  components: {
    HomeCard
  },
  data: () => ({
    thedialog: false,
    drawer: false
  }),
  methods: {
    log(){
      alert("SUp")
    }
  },
  apollo:{
    client: {
      query: CLIENT,
      update (data) {
        this.$store.dispatch("prepareClient", data.client)
      }
    }
  }
}
</script>
