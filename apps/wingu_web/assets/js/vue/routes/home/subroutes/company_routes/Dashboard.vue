<template>
  <v-container fluid :class='$vuetify.breakpoint.smAndDown ? "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-layout data-aos='fade-up' row wrap fill-height>
      <v-flex xs12 sm8 md6>
        <!--style='max-height:286px; overflow-y: auto;'-->
        <!--:full-width='$vuetify.breakpoint.lgAndDown'-->
        <v-date-picker
          header-color='primary'
          class='elevation-1'
          :events='events'
          :show-week='$vuetify.breakpoint.xsOnly'
          full-width
          :landscape='!$vuetify.breakpoint.xsOnly' 
          v-model='tday' />
      </v-flex>
      <v-flex xs12 sm4 md6>
        <v-card 
          tile>
          <v-divider v-if='$vuetify.breakpoint.xsOnly'/>
          <v-card-title class='mytitle'>
            <v-btn 
              icon round small color='secondary'>
              <v-icon small>
                event_seat
              </v-icon>
            </v-btn>
            <v-layout column>
              <span class='mytitle'>
                <strong>Events</strong>
              </span>
              <span style='font-size: 12px;'>{{events.length}} this month</span>
            </v-layout>
            <v-spacer></v-spacer>
            <v-btn v-if='$vuetify.breakpoint.xsOnly || $vuetify.breakpoint.mdAndUp' small round outline>
              <v-icon left small>
                event_note
              </v-icon>
              Create
            </v-btn>
            <v-btn v-else color='secondary' small round icon outline>
              <v-icon small>
                add
              </v-icon>
            </v-btn>
          </v-card-title>
          <v-divider />
          <v-card-text style='height: 213px;overflow-y: auto;'>
            <v-layout row :wrap='!$vuetify.breakpoint.xsOnly'>
              <v-flex v-for='i in 6' :key='i' :pa-1='$vuetify.breakpoint.mdAndUp' xs12 md6 d-flex align-center justify-content-center>
                <v-card style='border-radius: 8px;' hover
                  :class='$vuetify.breakpoint.xsOnly ? "mr-1 my-1" : "my-1"' 
                  height='150' :width='$vuetify.breakpoint.xsOnly ? 250 : ""'>
                </v-card>
              </v-flex>
            </v-layout>
          </v-card-text>
        </v-card>
      </v-flex>
      <v-flex xs12>
        <v-card>
          <v-divider v-if='$vuetify.breakpoint.smAndDown' />
          <v-card-title>
            <v-btn color='secondary' small icon round>
              <v-icon small>
                description
              </v-icon>
            </v-btn>
            <v-layout column>
              <span class='mytitle'> 
                <strong>Recent Documents</strong>
              </span>
              <span style='font-size: 12px;'>
                24 available
              </span>
            </v-layout>
          </v-card-title>
          <v-divider />
          <v-text-field
            append-icon="mic"
            class="mx-3 my-1"
            flat
            label="Search"
            prepend-inner-icon="search"
            hide-details
            solo-inverted
            ></v-text-field>
          <v-divider />
          <!--<v-card-text style='height: 213px;overflow-y: auto;'>-->
            <v-slide-y-reverse-transition hide-on-leave>
              <v-card-text 
                v-show='!showDocClassForm'
                :style='$vuetify.breakpoint.smAndDown 
                ? "height: 200px; overflow-y: auto;" : "max-height: 430px; overflow-y: auto;"'
                >
                <!--v-if="$store.state.store.documentClasses.length > 0" -->
                <v-layout 
                  v-if="$apollo.queries.documentClasses.loading || $store.state.store.documentClasses.length>0" 
                  row :wrap='!$vuetify.breakpoint.xsOnly'>
                  <v-flex v-for='i in $store.state.store.documentClasses' 
                    :key='i.id' :pa-0='$vuetify.breakpoint.mdAndUp' xs12 sm4 md3 d-flex align-center justify-content-center>
                    <DocCard :docclass='i' />
                  </v-flex>
                </v-layout>
                <v-layout v-else column wrap align-center justify-content-center>
                  <v-card flat width='300' height='150' 
                    v-if='$store.state.store.documentClasses.length < 1'>
                    <v-card-text class='mt-3 pa-4 text-xs-justify d-flex align-center justify-content-center'>
                      <span>
                        There are no document classes available currently. Click 
                        <kbd style="cursor: pointer;background-color: purple;" @click='showDocClassForm=!showDocClassForm'>create</kbd> to save a new one 
                      </span>
                    </v-card-text>
                  </v-card>
                  <v-card v-else flat height='200'>
                    <v-layout d-flex align-center justify-content-center 
                      column fill-height>
                      <v-progress-circular indeterminate color="orange"></v-progress-circular>
                    </v-layout>
                  </v-card>
                </v-layout>
              </v-card-text>
            </v-slide-y-reverse-transition>
            <v-divider />
            <v-slide-y-transition hide-on-leave>
              <v-card-text v-show='showDocClassForm'>
                <v-layout row wrap>
                  <v-flex xs12 sm6 md5 lg4>
                    Material icons are delightful, beautifully crafted symbols for common actions and items. Download on desktop to use them in your digital products for Android, iOS, and web.
                  </v-flex>
                  <v-flex xs12 sm6  md7 lg8:pa-5='$vuetify.breakpoint.lgAndUp'>
                  </v-flex>
                </v-layout>
              </v-card-text>
            </v-slide-y-transition>
            <v-divider />
            <v-card-actions>
              <!--<v-spacer></v-spacer>-->
              <v-btn @click='showDocClassForm = !showDocClassForm' round outline small>
                new
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </template>
  <script charset="utf-8">
import DocCard from './components/DocCard.vue'
import { COMPANY_DOC_CLASSES } from "../../../../graphql/queries.js"
export default{
  name: "Dashboard",
  components: { DocCard },
  data: () => ({
    tday: '2019-03-14',
    events: [
'2019-03-14',
'2019-03-12',
'2019-03-22',
'2019-03-2',
    ],
    calMenu: false, 
    showDocClassForm: false,
  }),
  apollo: {
    documentClasses: {
      skip: false,
      query: COMPANY_DOC_CLASSES, 
      variables() {
        return {
          //iD: "8b83339f-b60e-40a4-b169-afeec465ac0d"
          iD: this.$route.params.id
        }
      },
      update(data){
        this.$store.dispatch("prepareDocumentClasses", data.documentClasses)
      },
      error(){
      }
    }
  },
  methods: {
    log(e){
      console.dir(this)
    }
  }
}
</script>
<style scoped type="text/css" media="screen">
.v-card--hover{
  border-radius: 8px;
  background-image: linear-gradient(to bottom, #AA076BFF, #61045F00);
  background-color: #61045fff;
}
.v-card--hover:hover{
  background-color: #aa076bff;
  transform: translateY(-7.5px);
}
</style>
