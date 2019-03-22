<template>
  <v-app style='font-family: "Montserrat", sans-serif;'> 
    <v-toolbar app height='80' :class='$vuetify.breakpoint.smAndUp ? "elevation-1" : "elevation-1" ' dark color='primary'>
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
    <router-view></router-view>
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
export default {
  name: 'Home',
  mounted(){
    // this.$apollo.queries.client.start()
    if (/localhost/i.test(window.location)) {
      this.$apollo.queries.client.start()
      this.$apollo.queries.my_companies.start()
    }
  },
  data: () => ({
    drawer: false,
    snackbar: false,
    error: "",
    offsetTop: 0,
    scroll: 0,
  }),
  methods: {
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
