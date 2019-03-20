<template>
  <v-app style='font-family: "Montserrat", sans-serif;'> 
    <v-toolbar app height='80' dark color='primary' class='elevation-1'>
      <v-btn outline data-aos='zoom-in' data-aos-delay='200' icon @click='$router.push("/")'>
        <v-icon small>
          home
        </v-icon>
      </v-btn>
      <v-btn data-aos='fade-right' flat round outline>
        <v-icon small left>
          android
        </v-icon>
        connect
      </v-btn>
      <v-spacer></v-spacer>
      <v-avatar v-if='$store.state.store.client.picture != undefined'>
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
    <v-content class='mycontent d-flex align-center justify-content-center'>
      <!--<v-container fluid>-->
      <!--<v-card dark color='primary' flat tile>-->
          <!--:height='$vuetify.breakpoint.lgAndUp ? 500 : 500'-->
        <!--<v-img-->
          <!--:height='$vuetify.breakpoint.mdAndUp ? 600 : ""'-->
          <!--src='/images/biz_b.jpg'-->
          <!--lazy-src='/images/biz.jpg'-->
          <!--gradient="to bottom , rgba(0,0,0,.1), rgba(0,0,0, .7), rgba(0,0,0,1)"-->
          <!--<template v-slot:placeholder>-->
            <!--<v-layout-->
              <!--fill-height-->
              <!--align-center-->
              <!--justify-center-->
              <!--ma-0>-->
              <!--<v-progress-circular indeterminate color="orange"></v-progress-circular>-->
            <!--</v-layout>-->
          <!--</template>-->
          <!--<v-container fluid>-->
            <!--<v-layout row wrap fill-height d-flex align-center justify-content-center>-->
              <v-layout row wrap fill-height class='mygradient' style='max-width: 1024px;'>
                <v-flex xs12 sm6 md6 lg6 class='py-5 px-2 white--text' d-flex align-center justify-content-center>
                  <div>
                    <h1 data-aos='fade' class='text-xs-center mx-5' style='font-size:3.26em;'> 
                      Get up to scale
                    </h1>
                    <h3 data-aos='fade' data-aos-delay='200' class='pa-2 text-xs-center mx-3'>
                      Short stuff here describing this action in depth
                    </h3>
                    <span data-aos='flip-left' data-aos-delay='250' 
                  id="cardanchor"
                      style='display:flex; align-items:center; justify-content: center'
                      class='mt-5'>
                      <v-btn dark @click='showRegister=!showRegister' color='deep-orange' round >
                        <v-icon left small>
                          {{ showRegister ? "touch_app" : "business_center" }}
                        </v-icon>
                        <strong>
                          {{ showRegister ? "Select" : "Register"}}
                        </strong>
                      </v-btn>
                    </span>
                  </div>
                </v-flex>
                <v-flex 
                  data-aos='fade-up' data-aos-delay='300' 
                  :data-aos-offset='$vuetify.breakpoint.xsOnly ? -200 : 0'
                  xs12 sm6 md6 lg6 d-flex>
                  <HomeCard v-bind:showRegister='showRegister' 
                    v-on:emitOpenCard='() => showRegister = true'
                    v-on:emitCloseCard='() => showRegister = false'/>
                </v-flex>
              </v-layout>
              <v-divider v-if='$vuetify.breakpoint.lgAndUp'/>
              <!--</v-container>-->
            <!--</v-img>-->
          <!--</v-card>-->
        <!--</v-container>-->
    </v-content>
    <v-snackbar
      v-model="snackbar"
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
import HomeCard from './components/HomeCard.vue'
export default {
  name: 'Home',
  mounted(){
    // this.$apollo.queries.client.start()
    if (/localhost/i.test(window.location)) {
     this.$apollo.queries.client.start()
     this.$apollo.queries.my_companies.start()
    }
  },
  components: {
    HomeCard
  },
  data: () => ({
    thedialog: false,
    drawer: false,
    snackbar: false,
    showRegister: false,
    error: "",
  }),
  methods: {
    log(){
      alert("SUp")
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
<style scoped type="text/css" media="screen">
.mycontent{
  background-color: rgba(138, 119, 162, 1);
  background-image: linear-gradient(to bottom, #00000011, #000000d6), url("/images/biz_b.jpg");
  background-repeat: no-repeat;
  background-position: top;
  background-size: cover;
  -webkit-backdrop-filter: blur(5px); /* Use for Safari 9+, Edge 17+ (not a mistake) and iOS Safari 9.2+ */
  backdrop-filter: blur(5px);
}
.mygradient{
  /*background-image: linear-gradient(to bottom, #00000b00, #dc4225aa);*/
  margin-left: auto;
  margin-right: auto;
}
</style>
