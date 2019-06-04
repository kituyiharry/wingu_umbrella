<template> 
  <v-container fluid>
    <v-layout fill-height row wrap>
      <v-flex :pa-1='$vuetify.breakpoint.mdAndUp' v-for='i in 6' :key='i' xs12 sm6 lg4>
        <v-card dark data-aos-offset='-200' data-aos='zoom-in-up' :data-aos-delay='i*50' height='220' flat color='primary'>
          <v-layout fill-height row wrap>
            <v-flex xs12 d-flex align-center justify-content-center>
              <span class='text-xs-center'>
              <v-icon large>
                menu
              </v-icon>
              </span>
            </v-flex>
          </v-layout>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>
<script charset="utf-8">
export default {
name: "Index",
data: ()=>({
})
}
</script>
