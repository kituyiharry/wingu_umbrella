<template>
  <v-app style='font-family: "Montserrat", sans-serif;'> 
    <v-navigation-drawer app v-model='drawer'>
      <v-card flat tile height='250' color='primary'>
      </v-card>
    </v-navigation-drawer>
    <v-toolbar app height='80' dark color='primary' flat>
      <v-toolbar-side-icon @click='drawer=!drawer'/>
      <v-toolbar-title>
        Home
      </v-toolbar-title>
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
      <v-container fluid>
      </v-container>
    </v-content>
  </v-app>
</template>
<script charset="utf-8">
import { CLIENT } from '../../graphql/queries.js'
export default {
  name: 'Home',
  data: () => ({
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
