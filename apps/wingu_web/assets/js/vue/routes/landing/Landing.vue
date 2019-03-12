<template>
  <v-app style='font-family: "Montserrat", sans-serif;'>
    <v-toolbar class='elevation-0' flat>
      <v-toolbar-title style='font-family: "Raleway", sans-serif; font-size:24px;'>
        {{name}}
      </v-toolbar-title>
    </v-toolbar>
    <v-content>
      <v-container fluid>
        <v-flex xs4>
          <v-card flat>
            <v-card-title>
              Patrolmans association
            </v-card-title>
          </v-card>
        </v-flex>
      </v-container>
    </v-content>
  </v-app>
</template>
<script charset="utf-8">
export default{
  name: 'Landing',
  data: () => ({
    name: "Sahihisha"
  })
}
</script>
