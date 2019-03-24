<template>
  <v-content class='mycontent d-flex align-center justify-content-center'>
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
        <HomeCard 
          v-bind:showRegister='showRegister' 
          v-on:emitOpenCard='() => showRegister = true'
          v-on:emitCloseCard='() => showRegister = false'/>
      </v-flex>
    </v-layout>
    <v-divider v-if='$vuetify.breakpoint.lgAndUp'/>
  </v-content>
</template>
<script charset="utf-8">
import HomeCard from '../components/HomeCard.vue'
export default{
  name: 'Index',
  components: {
    HomeCard
  },
  data: () => ({
    showRegister: false,
  })
}
</script>
<style scoped type="text/css" media="screen">
.mycontent{
  /*background-color: rgba(138, 119, 162, 1);*/
  /*background-image: linear-gradient(to bottom, #00000011, #000000d6), url("/images/biz_b.jpg");*/
  background-image: linear-gradient(to bottom, #AA076BFF, #61045FFF);
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
