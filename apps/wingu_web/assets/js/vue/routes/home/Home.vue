<template>
  <v-app style='font-family: "Montserrat", sans-serif;'> 
    <v-navigation-drawer app value='true' fixed permanent>
    </v-navigation-drawer>
    <v-toolbar dark color='primary' flat extended>
      <v-toolbar-title>
        Home
      </v-toolbar-title>
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
  }),
  apollo:{
    client: {
      query: CLIENT,
      update (data) {
        console.dir(data)
      }
    }
  }
}
</script>
