<template>
  <v-card flat
    :class='$vuetify.breakpoint.smAndUp ?  
    $vuetify.breakpoint.smOnly ? "ma-2 allborder" : "ma-3 allborder" 
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
          Smooth animations help make a UI feel great. Using Vue's transition system and re-usable functional components, 
          you can easily control the motion of your application
        </v-card-text>
        <v-divider />
        <v-card-text id='stations' style='max-height: 230px;overflow-y:scroll;'>
          <v-layout row wrap v-if='$store.state.store.companies.length > 0' class='d-flex align-center justify-content-center'>
            <v-flex class='my-2' xs6 sm4 v-for='i in $store.state.store.companies' :key='i.id'>
              <div class='mx-2'
                data-aos='fade-up' data-aos-anchor='#stations' data-aos-anchor-placement='bottom-bottom'
                >
                <CompanyElement :company='i' />
              </div>
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
          Use a counter prop to inform a user of the character limit. The counter does not perform any validation. You will need to pair it with either the internal validation system. 
        </v-card-text>
        <v-divider />
        <v-card-text class='py-0' style='max-height: 213px; overflow: auto;'>
          <v-layout row wrap class='mt-1'>
            <v-flex xs12>
              <v-text-field prepend-inner-icon='business_center' box
                :class='$vuetify.breakpoint.lgAndUp ? "mx-1" : ""' 
                counter='63'
                hint='Official business name for your company'
                v-model='businessName'
                clearable
                label='Business name'>
              </v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field prepend-inner-icon='mail' box 
                :class='$vuetify.breakpoint.lgAndUp ? "mx-1" : ""' 
                clearable
                type='email'
                v-model='email'
                hint='Mail address for your business'
                name='' label='E-mail'>
              </v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field prepend-inner-icon='work' box 
                :class='$vuetify.breakpoint.lgAndUp ? "mx-1" : ""' 
                clearable
                v-model='role'
                :counter=63
                hint='Your role in this institution'
                name='' label='Role'>
              </v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-textarea prepend-inner-icon='description' box 
                :class='$vuetify.breakpoint.lgAndUp ? "mx-1" : ""' 
                clearable :conter='280'
                v-model='description'
                hint='Describe your role in a tweet'
                name='' label='Description'>
              </v-textarea>
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
          <v-btn @click='createCompany' small outline color='success' flat round>
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
import { CREATE_COMPANY } from '../../../graphql/mutations.js'
import CompanyElement from './CompanyElement.vue'
export default{
  name: "HomeCard",
  components: { CompanyElement },
  props: ['showRegister'],
  data: () => ({
    email: "",
    businessName: "",
    role: "",
    description: ""
    // showRegister: false,
  }),
  methods: {
    async createCompany(){
      let params = {
        email: this.email,
        name: this.businessName
      }
      let role = this.role
      let desc = this.description
      this.$apollo.mutate({
        mutation: CREATE_COMPANY,
        variables: {
          params: params,
          role: role,
          description: desc
        },
      }).then(console.dir).catch(alert)
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
