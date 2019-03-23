<template>
  <v-card light flat
    :class='$vuetify.breakpoint.smAndUp ?  
    $vuetify.breakpoint.smOnly ? "ma-3 allborder" : "ma-4 allborder" 
    : "halfborder"' 
    style='border-top-left-radius:16px; border-top-right-radius:16px;'>
    <v-card-title>
      <div data-aos='zoom-in' data-aos-delay='450' data-aos-anchor='#cardanchor'>
        <v-btn color='primary' icon small outline>
          <v-icon small>
            {{ showRegister ? "business" : "touch_app"}}
          </v-icon>
        </v-btn>
      </div>
      <v-slide-y-transition hide-on-leave>
        <span v-show='!showRegister' style='font-size: 20px; font-weight: bold;'>
          Select station
        </span>
      </v-slide-y-transition>
      <v-slide-y-reverse-transition hide-on-leave>
        <span v-show='showRegister' style='font-size: 20px; font-weight: bold;'>
          Register your business
        </span>
      </v-slide-y-reverse-transition>
    </v-card-title>
    <v-divider />
    <v-slide-y-transition hide-on-leave>
      <div v-show='!showRegister'>
        <v-card-text>
          Smooth animations help make a UI feel great. Using Vue's transition system and re-usable functional components, you can easily control the motion of your application
        </v-card-text>
        <v-divider />
        <v-card-text id='stations' style='max-height: 230px;overflow-y:scroll;'>
          <v-layout row wrap v-if='$store.state.store.companies.length > 0' class='d-flex align-center justify-content-center'>
            <v-flex xs4 sm2 lg2 v-for='i in $store.state.store.companies' :key='i.id' class='d-flex align-center justify-content-center'>
              <v-card hover @click='$router.push(`/b/${i.id}`)'
                data-aos='fade-up' data-aos-anchor='#stations' data-aos-anchor-placement='bottom-bottom'
                v-ripple color='primary' class='' style='border-radius: 8px;'>
                <v-layout column align-center pa-2>
                  <v-avatar data-aos='zoom-in' data-aos-anchor='#stations' 
                    data-aos-anchor-placement='bottom-bottom' :data-aos-delay='(i+1)*100'>
                    <v-img src='/images/sahihi.png' alt=''>
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
                  <!--<span class='text-xs-center' data-aos='fade' data-aos-anchor='#stations' data-aos-anchor-placement='center-bottom' :data-aos-delay='i*50'>-->
                    <v-chip flat small label color='primary lighten-1' class='white--text'>
                      <v-avatar tile class="deep-orange">
                        <strong>
                          {{ i.name | first }}
                        </strong> 
                      </v-avatar>
                      {{ i.name }}
                    </v-chip>
                  </v-layout>
                </v-card>
                <!--</span>-->
            </v-flex>
          </v-layout>
          <span class='text-xs-center' v-else>
            <em>You are not enrolled to any business</em>
          </span>
        </v-card-text>
      </div>
    </v-slide-y-transition>
    <v-slide-y-reverse-transition hide-on-leave>
      <div v-show='showRegister'> 
        <v-card-text>
          Use a counter prop to inform a user of the character limit. The counter does not perform any validation by itself. You will need to pair it with either the internal validation system, or a 3rd party library. 
        </v-card-text>
        <v-divider />
        <v-card-text>
          <v-layout row wrap class='mt-1'>
            <v-flex xs12>
              <v-text-field prepend-inner-icon='business_center' box
                :class='$vuetify.breakpoint.lgAndUp ? "mx-1" : ""' 
                counter='63'
                hint='Official business name for your company'
                clearable
                label='Business name'>
              </v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field prepend-inner-icon='mail' box 
                :class='$vuetify.breakpoint.lgAndUp ? "mx-1" : ""' 
                clearable
                hint='Mail address for your business'
                name='' label='E-mail'>
              </v-text-field>
            </v-flex>
          </v-layout>
        </v-card-text>
      </div>
    </v-slide-y-reverse-transition>
    <v-divider />
    <v-card-actions> 
      <v-slide-x-transition hide-on-leave>
        <v-btn v-show='!showRegister' @click='$emit("emitOpenCard")' small outline round color='secondary'>
          register
          <v-icon right small>
            business
          </v-icon>
        </v-btn>
      </v-slide-x-transition>
      <v-spacer></v-spacer>
      <v-scroll-x-reverse-transition hide-on-leave>
        <div v-show='showRegister'>
          <v-btn @click='$router.push("/b/8b83339f-b60e-40a4-b169-afeec465ac0d")' small outline color='success' flat round>
            continue
            <v-icon small right>
              keyboard_arrow_right
            </v-icon>
          </v-btn>
          <v-btn @click='$emit("emitCloseCard")' small outline color='error' flat round>
            pick
            <v-icon small right>
              close
            </v-icon>
          </v-btn>
        </div>
      </v-scroll-x-reverse-transition>
    </v-card-actions>
  </v-card>
</template>
<script charset="utf-8">
export default{
  name: "HomeCard",
  props: ['showRegister'],
  data: () => ({
    // showRegister: false,
  }),
  filters: {
    first(letter){
      let fl = letter.split(" ")
      return(fl[0].slice(0,1))
    }
  }
}
</script>
<style scoped type="text/css" media="screen">
.allborder {
  border-radius: 16px;
}
.halfborder{
  border-top-left-radius: 32px;
  border-top-right-radius: 32px;
}
</style>
