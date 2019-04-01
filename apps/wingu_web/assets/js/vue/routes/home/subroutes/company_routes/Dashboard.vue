<template>
  <v-container fluid :class='$vuetify.breakpoint.smAndDown ? "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-layout data-aos='fade-up' row wrap fill-height>
      <v-slide-y-transition hide-on-leave>
        <v-flex v-show='showCalendar' xs12 sm8 md7>
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
      </v-slide-y-transition>
      <!--TODO: Landscape and Potrait support-->
      <v-slide-y-reverse-transition hide-on-leave>
        <v-flex v-show='!showCalendar' xs12 sm8 md7>
          <EventForm />
        </v-flex>
      </v-slide-y-reverse-transition>
      <v-flex xs12 sm4 md5>
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
              <span v-if='$apollo.queries.events.loading'>
                <v-progress-linear
                  indeterminate
                  color="red"
                  ></v-progress-linear>
              </span>
              <span v-else style='font-size: 12px;'>{{$store.state.store.events[$route.params.id].length}} this month</span>
            </v-layout>
            <v-spacer></v-spacer>
            <v-btn :color='!showCalendar ? "red lighten-2" : "green"' 
              @click='showCalendar=!showCalendar' v-if='$vuetify.breakpoint.xsOnly || $vuetify.breakpoint.mdAndUp' small round outline>
              <v-icon left small>
                {{ !showCalendar ? "close" : "event_note" }}
              </v-icon>
              {{ !showCalendar ? "Close"  : "Create" }}
            </v-btn>
            <v-btn @click='showCalendar=!showCalendar' v-else :color='showCalendar ? "green" : "red lighten-2"' small round icon outline>
              <v-icon small>
                {{ showCalendar ? "add" : "close" }}
              </v-icon>
            </v-btn>
          </v-card-title>
          <v-divider />
          <v-card-text style='height: 213px;overflow-y: auto;'>
            <v-layout v-if='!$apollo.queries.events.loading && $store.state.store.events[$route.params.id].length>0' row :wrap='!$vuetify.breakpoint.xsOnly'>
              <v-flex v-for='i in events' :key='i' :pa-1='$vuetify.breakpoint.mdAndUp' xs12 md6 d-flex align-center justify-content-center>
                <v-card style='border-radius: 8px;' hover
                  :class='$vuetify.breakpoint.xsOnly ? "mr-1 my-1" : "my-1"' 
                  height='150' :width='$vuetify.breakpoint.xsOnly ? 250 : ""'>
                </v-card>
              </v-flex>
            </v-layout>
            <v-layout v-else column d-flex align-center justify-content-center>
              <v-card height='100' class='d-flex align-center justify-content-center' flat tile>
                <v-card-text :mt-3='$vuetify.breakpoint.xsOnly' class='pa-4 text-xs-center d-flex align-center justify-content-center'>
                  <span>
                    There are no Events available currently. Click 
                    <kbd style="cursor: pointer;background-color: purple;" 
                      @click='showCalendar=!showCalendar'>create</kbd> to save a new one 
                  </span>
                </v-card-text>
              </v-card>
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
                <strong>Document Groups</strong>
              </span>
              <span style='font-size: 12px;'>
                {{ $store.state.store.documentClasses.length }} available
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
                    :key='i.id' px-1 :py-0='$vuetify.breakpoint.mdAndUp' xs12 sm4 md3 d-flex align-center justify-content-center>
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
              <v-card-text :class='$vuetify.breakpoint.smAndDown ? "pa-0" : ""' v-show='showDocClassForm'>
                <v-layout row wrap>
                  <v-flex class='primary white--text' :style='$vuetify.breakpoint.mdAndUp ? "border-radius: 8px;" : ""' 
                    xs12 sm6 pa-4 d-flex align-center justify-content-center>
                    Material icons are delightful, beautifully crafted symbols for common actions and items. 
                    Download on desktop to use them in your digital products for Android, iOS, and web.
                  </v-flex>
                  <v-flex xs12 sm6 :pa-2='$vuetify.breakpoint.smOnly || $vuetify.breakpoint.mdOnly' :pa-5='$vuetify.breakpoint.lgAndUp'>
                    <v-card flat tile>
                      <v-card-title>
                        <v-btn small icon round outline>
                          <v-icon small new>
                            add
                          </v-icon>
                        </v-btn>
                        <span style='font-size: 18px;'> 
                          <strong>New Group</strong>
                        </span>
                      </v-card-title>
                      <v-divider />
                      <v-card-text>
                        <v-layout column>
                          <v-form>
                            <v-text-field box v-model='docName' name='' clearable label='Document Class' :counter='63' :max='63'  prepend-inner-icon='folder_shared'
                              hint='Collective name for this group of files'>
                            </v-text-field>
                            <v-text-field box v-model='docDesc' name='' clearable label='Description' :counter='280' :max='280' prepend-inner-icon='description'
                              hint='A short description of this group'>
                            </v-text-field>
                          </v-form>
                        </v-layout>
                      </v-card-text>
                    </v-card>
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
              <v-spacer></v-spacer>
              <v-slide-x-reverse-transition>
                <div v-show='showDocClassForm'>
                  <v-btn @click='showDocClassForm=false' small color='red lighten-2' round outline>
                    discard
                  </v-btn>
                  <v-btn @click='createDocClass' small color='green' round outline>
                    save
                  </v-btn>
                </div>
              </v-slide-x-reverse-transition>
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </template>
  <script charset="utf-8">
import DocCard from './components/DocCard.vue'
import EventForm from './components/EventForm.vue'
import { COMPANY_DOC_CLASSES, EVENTS } from "../../../../graphql/queries.js"
import { CREATE_DOC_CLASS  } from "../../../../graphql/mutations.js"
export default{
  name: "Dashboard",
  components: { DocCard, EventForm },
  data: () => ({
    tday: '2019-03-14',
    showCalendar: true,
    myevents: [
'2019-03-14',
      '2019-03-12',
      '2019-03-22',
      '2019-03-2',
    ],
    calMenu: false, 
    showDocClassForm: false,
    docName: "",
    docDesc: ""
  }),
  computed: {
    events: {
      get() {
        return this.$store.state.store.events[this.$route.params.id]
      },
      set({id, value}) { this.$store.commit('mutateEvents', { id: id, ev: value}); },
    },
  },
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
      error(e){
        alert(e)
      }
    },
    events: {
      skip: false,
      query: EVENTS,
      variables() {
        return {
          iD: this.$route.params.id
        }
      },
      update(data){
        //this.$store.dispatch("prepareEvents", {id: this.$route.params.id, ev: data.companyEvents})
        this.events = { id: this.$route.params.id , value: data.companyEvents}
      },
      error(e){
        alert(e)
      }
    }
  },
  methods: {
    createDocClass(){
      this.$apollo.mutate({
        mutation: CREATE_DOC_CLASS,
        variables: {
          company: this.$route.params.id, 
          name:    this.docName, 
          description: this.docDesc
        }
      }).catch(alert).then(alert)
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
