<template>
  <v-container fluid :class='$vuetify.breakpoint.smAndDown ? "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-layout row wrap>
      <v-flex xs12>
        <v-card height='1400' color='secondary'>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>
<script charset="utf-8">
export default {
  name: "Stats",
  data: () => ({
  })
}
</script>
