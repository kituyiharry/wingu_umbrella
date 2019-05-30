<template>
  <v-content class='primary'>
    <v-divider />
    <v-container fluid style='height:90%;'>
      <v-layout fill-height row wrap>
        <v-flex :px-0='$vuetify.breakpoint.xsOnly' d-flex align-center justify-content-center xs12>
          <v-card data-aos='fade-up' dark color='primary lighten-1' max-width='430' style='margin-left: auto;margin-right: auto;border-radius: 8px;' flat>
            <v-layout row wrap>
              <v-flex d-flex align-center xs12>
              <v-avatar data-aos='zoom-in' data-aos-delay='400' size='72' class='mt-2'>
                <img :src='$store.state.store.client.picture==null ? "images/sahihi.jpg" : $store.state.store.client.picture ' alt=''>
              </v-avatar>
              </v-flex>
            </v-layout>
            <v-card-title class='pt-0'>
              <v-layout column>
                <v-flex d-flex>
                  <span style='font-family: Pacifico;font-size: 38px;width:100%;' class='white--text text-xs-center'>
                    <!--<strong>-->
                      Cerrelo
                    <!--</strong>-->
                  </span>
                </v-flex>
                <v-flex d-flex>
                  <span style='font-family: "Raleway" sans-serif;font-size:12px;' class='text-xs-center'>
                    Welcome Harry! 
                    <strong>|| </strong>
                    SSO
                  </span>
                </v-flex>
              </v-layout>
            </v-card-title>
            <v-divider />
            <v-card-title>
              <v-layout column>
                <v-flex 
                  py-2 :px-3='$vuetify.breakpoint.smAndUp'>
                  <v-text-field 
                    hide-details box clearable
                    prepend-inner-icon='domain' placeholder='eg name@company.tld' hint='Company Domain' color='white' name='login' label='Domain'>
                  </v-text-field>
                </v-flex>
                <v-flex 
                  :px-3='$vuetify.breakpoint.smAndUp' py-0 d-flex justify-content-center class=' text-xs-right'>
                  <a style='font-size: 12px;' href="/#/home" class='yellow--text' target="_blank">Setup a Company domain?</a>
                </v-flex>
                <v-flex 
                  py-2 :px-3='$vuetify.breakpoint.smAndUp'>
                  <v-text-field box hide-details type='password' clearable placeholder='******' 
                     hint='Password' color='white' class='white--text' name='pass' label='Password'>
                  </v-text-field>
                </v-flex>
                <v-flex :px-3='$vuetify.breakpoint.smAndUp' py-0 d-flex justify-content-center class=' text-xs-right'>
                  <a style='font-size:12px;' href="/#/home" class='yellow--text' target="_blank">Forgot your password?</a>
                </v-flex>
              </v-layout>
            </v-card-title>
            <v-divider />
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn small 
      @click="$router.push('/b/c7565100-f984-4121-9b90-169fdc0a339f')"
                color='red lighten-1'>
                <v-icon small left>
                  exit_to_app
                </v-icon>
                leave
              </v-btn>
              <v-btn disabled small color='green'>
                <v-icon small left>
                  open_in_new
                </v-icon>
                Sign In
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>
<script charset="utf-8">
//import HomeCard from '../components/HomeCard.vue'
                export default{
                  name: 'Index',
                  components: {
                    //HomeCard
                  },
                  data: () => ({
                    showRegister: false,
                  }),
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
