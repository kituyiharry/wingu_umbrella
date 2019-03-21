<template>
  <v-content class='mygradient'>
    <v-container fluid>
      <v-layout row wrap>
        <v-card hover height='300' width='300'>
        </v-card>
      </v-layout>
    </v-container>
  </v-content>
</template>
<script charset="utf-8">
export default {
  name: "CompanyView",
  data: () => ({
  })
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
