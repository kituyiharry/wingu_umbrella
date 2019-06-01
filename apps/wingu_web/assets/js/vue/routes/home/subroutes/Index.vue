<template>
  <v-content class='hero'>
    <v-container fluid style='height:100%;'>
      <v-layout fill-height row wrap>
        <v-flex :px-0='$vuetify.breakpoint.xsOnly' d-flex align-center justify-content-center xs12>
          <v-card data-aos='fade-up' dark color='primary' max-width='430' flat
            style='user-select: none;margin-left: auto;margin-right: auto;border-radius: 16px;'>
            <v-layout column class='pt-1 d-flex align-center'>
              <!--<v-flex pt-2 d-flex align-center xs12>-->
                <v-avatar data-aos='zoom-in' data-aos-delay='200' size='78' class='d-flex mt-2'>
                  <v-img 
                    lazy-src="images/sahihi.jpg" 
                    :src='$store.state.store.client.picture==null ? "images/sahihi.jpg" : $store.state.store.client.picture ' 
                    alt=''>
                    <template v-slot:placeholder>
                      <v-layout
                        fill-height
                        align-center
                        justify-center
                        ma-0
                        >
                        <v-progress-circular indeterminate color="secondary"></v-progress-circular>
                      </v-layout>
                    </template>
                  </v-img>
                </v-avatar>
                <!--</v-flex>-->
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
                  <a style='font-size: 11px;' href="/#/home" class='yellow--text' target="_blank">Setup a Company domain?</a>
                </v-flex>
                <v-flex 
                  py-2 :px-3='$vuetify.breakpoint.smAndUp'>
                  <v-text-field box hide-details type='password' clearable placeholder='******' 
                    hint='Password' color='white' class='white--text' name='pass' label='Password'>
                  </v-text-field>
                </v-flex>
                <v-flex :px-3='$vuetify.breakpoint.smAndUp' py-0 d-flex justify-content-center class=' text-xs-right'>
                  <a style='font-size:11px;' href="/#/home" class='yellow--text' target="_blank">Forgot your password?</a>
                </v-flex>
              </v-layout>
            </v-card-title>
            <v-divider />
            <v-card-actions class='px-4'>
              <v-spacer></v-spacer>
              <v-btn small @click="$router.push('/b/c7565100-f984-4121-9b90-169fdc0a339f')"
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
.hero{
  background-color: #DFDBE5;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='88' height='88' viewBox='0 0 88 88'%3E%3Cg fill='%23996fd6' fill-opacity='1'%3E%3Cpath fill-rule='evenodd' d='M29.42 29.41c.36-.36.58-.85.58-1.4V0h-4v26H0v4h28c.55 0 1.05-.22 1.41-.58h.01zm0 29.18c.36.36.58.86.58 1.4V88h-4V62H0v-4h28c.56 0 1.05.22 1.41.58zm29.16 0c-.36.36-.58.85-.58 1.4V88h4V62h26v-4H60c-.55 0-1.05.22-1.41.58h-.01zM62 26V0h-4v28c0 .55.22 1.05.58 1.41.37.37.86.59 1.41.59H88v-4H62zM18 36c0-1.1.9-2 2-2h10a2 2 0 1 1 0 4H20a2 2 0 0 1-2-2zm0 16c0-1.1.9-2 2-2h10a2 2 0 1 1 0 4H20a2 2 0 0 1-2-2zm16-26a2 2 0 0 1 2-2 2 2 0 0 1 2 2v4a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-4zm16 0a2 2 0 0 1 2-2 2 2 0 0 1 2 2v4a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-4zM34 58a2 2 0 0 1 2-2 2 2 0 0 1 2 2v4a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-4zm16 0a2 2 0 0 1 2-2 2 2 0 0 1 2 2v4a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-4zM34 78a2 2 0 0 1 2-2 2 2 0 0 1 2 2v6a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-6zm16 0a2 2 0 0 1 2-2 2 2 0 0 1 2 2v6a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-6zM34 4a2 2 0 0 1 2-2 2 2 0 0 1 2 2v6a2 2 0 0 1-2 2 2 2 0 0 1-2-2V4zm16 0a2 2 0 0 1 2-2 2 2 0 0 1 2 2v6a2 2 0 0 1-2 2 2 2 0 0 1-2-2V4zm-8 82a2 2 0 1 1 4 0v2h-4v-2zm0-68a2 2 0 1 1 4 0v10a2 2 0 1 1-4 0V18zM66 4a2 2 0 1 1 4 0v8a2 2 0 1 1-4 0V4zm0 72a2 2 0 1 1 4 0v8a2 2 0 1 1-4 0v-8zm-48 0a2 2 0 1 1 4 0v8a2 2 0 1 1-4 0v-8zm0-72a2 2 0 1 1 4 0v8a2 2 0 1 1-4 0V4zm24-4h4v2a2 2 0 1 1-4 0V0zm0 60a2 2 0 1 1 4 0v10a2 2 0 1 1-4 0V60zm14-24c0-1.1.9-2 2-2h10a2 2 0 1 1 0 4H58a2 2 0 0 1-2-2zm0 16c0-1.1.9-2 2-2h10a2 2 0 1 1 0 4H58a2 2 0 0 1-2-2zm-28-6a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm8 26a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm16 0a2 2 0 1 0 0-4 2 2 0 0 0 0 4zM36 20a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm16 0a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm-8-8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 68a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm16-34a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm16-12a2 2 0 1 0 0 4 6 6 0 1 1 0 12 2 2 0 1 0 0 4 10 10 0 1 0 0-20zm-64 0a2 2 0 1 1 0 4 6 6 0 1 0 0 12 2 2 0 1 1 0 4 10 10 0 1 1 0-20zm56-12a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 48a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm-48 0a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0-48a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm24 32a10 10 0 1 1 0-20 10 10 0 0 1 0 20zm0-4a6 6 0 1 0 0-12 6 6 0 0 0 0 12zm36-36a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-4a2 2 0 1 0 0-4 2 2 0 0 0 0 4zM10 44c0-1.1.9-2 2-2h8a2 2 0 1 1 0 4h-8a2 2 0 0 1-2-2zm56 0c0-1.1.9-2 2-2h8a2 2 0 1 1 0 4h-8a2 2 0 0 1-2-2zm8 24c0-1.1.9-2 2-2h8a2 2 0 1 1 0 4h-8a2 2 0 0 1-2-2zM3 68c0-1.1.9-2 2-2h8a2 2 0 1 1 0 4H5a2 2 0 0 1-2-2zm0-48c0-1.1.9-2 2-2h8a2 2 0 1 1 0 4H5a2 2 0 0 1-2-2zm71 0c0-1.1.9-2 2-2h8a2 2 0 1 1 0 4h-8a2 2 0 0 1-2-2zm6 66a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-4a2 2 0 1 0 0-4 2 2 0 0 0 0 4zM8 86a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-4a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0-68A6 6 0 1 1 8 2a6 6 0 0 1 0 12zm0-4a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm36 36a2 2 0 1 0 0-4 2 2 0 0 0 0 4z'/%3E%3C/g%3E%3C/svg%3E");
  background-repeat: repeat;
}
</style>
