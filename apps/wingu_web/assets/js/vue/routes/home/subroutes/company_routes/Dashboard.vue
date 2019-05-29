<template>
  <v-container fluid :class='$vuetify.breakpoint.smAndDown ? "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-card :style='$vuetify.breakpoint.mdAndUp ? 
      "border-radius: 4px; background: linear-gradient(to bottom, #214e53, #A229D2)" : 
      "background: linear-gradient(to right, #214e53, indigo)"' 
      class="white--text" flat>
      <v-card-title>
        <span style='font-size: 32px;width:100%;font-weight: bold;'>Events and Glance</span><br/>
        <span>Your data available here</span>
      </v-card-title>
      <v-card-actions class='px-3'>
        <v-spacer></v-spacer>
        <v-menu :close-on-content-click='false' slide-y-transition offset-y attach>
          <div>
            <div class="up-arrow" style='margin-left: 30px;'>
            </div>
            <v-card class='elevation-5' style='border-radius: 8px;'>
              <v-card-title>
                <strong style='font-size:16px;' class='px-3'>Collections</strong>
              </v-card-title>
              <v-divider />
              <v-card-text style='height:200px;overflow-y: auto;'>
              </v-card-text>
            </v-card>
          </div>
          <v-card slot='activator' class='elevation-3' style='border-radius: 8px;'>
            <v-list two-line dense subheader>
              <v-subheader>
                Select a document
              </v-subheader>
              <v-divider />
              <v-list-tile
                avatar ripple
                @click=""
                >
                <v-list-tile-avatar>
                  <v-avatar size='32'>
                    <v-icon>settings</v-icon>
                  </v-avatar>
                </v-list-tile-avatar>

                <v-list-tile-content>
                  <v-list-tile-title>Medical Records</v-list-tile-title>
                  <v-list-tile-sub-title>A Wordy insert Description here</v-list-tile-sub-title>
                </v-list-tile-content>

                <!--<v-list-tile-action>-->
                  <!--<v-btn icon ripple>-->
                    <!--<v-icon color="grey lighten-1">info</v-icon>-->
                    <!--</v-btn>-->
                  <!--</v-list-tile-action>-->
              </v-list-tile>

            </v-list>
          </v-card>
        </v-menu>
      </v-card-actions>
      <v-divider />
      <v-card-text class='px-1'>
        <v-layout data-aos='fade-up' row wrap fill-height>
          <v-slide-y-transition hide-on-leave>
            <v-flex v-show='showCalendar' xs12 md7 pa-1>
              <!--style='max-height:286px; overflow-y: auto;'-->
              <!--:full-width='$vuetify.breakpoint.lgAndDown'-->
              <v-card style='border-radius: 8px;'>
                <v-card-text style='min-height: 250px;'>
                  <v-layout fill-height row wrap>
                    <v-flex xs12 lg4>
                      <v-card flat tile>
                        <v-card-title>
                          <v-layout column>
                            <v-flex>
                              <strong style='font-size:24px;'>Event Name</strong>
                            </v-flex>
                            <v-flex>
                              <span class='grey--text'>Some description stuff</span>
                            </v-flex>
                          </v-layout>
                        </v-card-title>
                        <v-divider />
                        <v-card-text>
                          <v-list two-line subheader>
                            <v-subheader>General</v-subheader>
                            <v-list-tile>
                              <v-list-tile-content>
                                <v-list-tile-title>Profile photo</v-list-tile-title>
                                <v-list-tile-sub-title>Change your Google+ profile photo</v-list-tile-sub-title>
                              </v-list-tile-content>
                            </v-list-tile>
                            <v-list-tile avatar>
                              <v-list-tile-content>
                                <v-list-tile-title>Show your status</v-list-tile-title>
                                <v-list-tile-sub-title>Your status is visible to everyone
                                </v-list-tile-sub-title>
                              </v-list-tile-content>
                            </v-list-tile>
                          </v-list>
                        </v-card-text>
                      </v-card>
                    </v-flex>
                    <v-flex xs12 lg8> 
                      <v-layout fill-height column wrap>
                        <v-flex style='min-height:250px;height: 100%;'>
                          <div style='height: 100%;' id='eventsVis'/>
                        </v-flex>
                      </v-layout>
                    </v-flex>
                  </v-layout>
                </v-card-text>
                <v-divider />
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn icon small flat>
                    <v-icon small>
                      share
                    </v-icon>
                  </v-btn>
                  <v-btn icon small flat>
                    <v-icon small>
                      delete
                    </v-icon>
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-flex>
          </v-slide-y-transition>
          <!--TODO: Landscape and Potrait support-->
          <v-slide-y-reverse-transition hide-on-leave>
            <v-flex v-show='!showCalendar' xs12 md7>
              <EventForm />
            </v-flex>
          </v-slide-y-reverse-transition>
          <v-flex xs12 md5 pa-1>
            <v-card style='border-radius: 8px;' 
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
                    <strong>Event Description</strong>
                  </span>
                  <span v-if='$apollo.queries.events.loading'>
                    <v-progress-linear
                      indeterminate
                      color="red"
                      ></v-progress-linear>
                  </span>
                  <span v-else style='font-size: 12px;'>Some description text</span>
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
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-chip small label>
                  <v-icon small left>
                    bookmark
                  </v-icon>
                  $ 200
                </v-chip>
                <v-chip small label>
                  <v-icon small left>
                    event_seat
                  </v-icon>
                  500
                </v-chip>
              </v-card-actions>
              <v-divider />
              <v-card-text style='overflow-y: auto;'>
                <v-layout v-if='!$apollo.queries.events.loading && $store.state.store.events[$route.params.id].length>0' row :wrap='!$vuetify.breakpoint.xsOnly' column>
                  <v-flex  py-0 :px-3='$vuetify.breakpoint.mdAndUp'>
                    <!--<v-card flat tile>-->
                      <!--<v-card-text class='px-0'>-->
                            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                            tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
                            vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
                            no sea takimata sanctus est Lorem ipsum dolor sit amet.
                      <!--</v-card-text>-->
                    <!--</v-card>-->
                  </v-flex>
                  <v-flex>
                    <v-card flat tile>
                      <!--<v-card-title class='py-0'>-->
                        <v-subheader style='font-size: 14px;'>
                        Chaperones
                        </v-subheader>
                      <!--</v-card-title>-->
                      <v-card-text class='py-0'>
                        <v-avatar size='48' v-for='i in 
                          ["https://avataaars.io/?avatarStyle=Circle&topType=LongHairFrida&accessoriesType=Kurt&hairColor=Red&facialHairType=BeardLight&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=Wink&eyebrowType=RaisedExcitedNatural&mouthType=Disbelief&skinColor=Brown",
                          "https://avataaars.io/?avatarStyle=Circle&topType=ShortHairFrizzle&accessoriesType=Prescription02&hairColor=Black&facialHairType=MoustacheMagnum&facialHairColor=BrownDark&clotheType=BlazerSweater&clotheColor=Black&eyeType=Default&eyebrowType=FlatNatural&mouthType=Default&skinColor=Tanned",
                          "https://avataaars.io/?avatarStyle=Circle&topType=LongHairMiaWallace&accessoriesType=Sunglasses&hairColor=BlondeGolden&facialHairType=Blank&clotheType=BlazerSweater&eyeType=Surprised&eyebrowType=RaisedExcited&mouthType=Smile&skinColor=Pale"
                          ]
                          ' class=''>
                          <img :src='i' alt=''>
                        </v-avatar>
                      </v-card-text>
                      <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn round small>
                            stuff
                        </v-btn>
                      </v-card-actions>
                    </v-card>
                  </v-flex>
                </v-layout>
                <v-layout v-else column d-flex align-center justify-content-center>
                  <v-card height='100' class='d-flex align-center justify-content-center' flat tile>
                    <v-card-text :mt-3='$vuetify.breakpoint.xsOnly' class='pa-4 text-xs-center d-flex align-center justify-content-center'>
                      <span>
                        There are no Events available currently selected
                        <kbd style="cursor: pointer;background-color: purple;" 
                          @click='showCalendar=!showCalendar'>create</kbd> to save a new one 
                      </span>
                    </v-card-text>
                  </v-card>
                </v-layout>
              </v-card-text>
            </v-card>
          </v-flex>
          <v-flex xs12 lg6 pa-1>
            <v-card height='300' style='border-radius: 8px;'>
            </v-card>
          </v-flex>
          <v-flex xs12 lg3 pa-1>
            <v-card height='300' style='border-radius: 8px;'>
            </v-card>
          </v-flex>
          <v-flex xs12 lg3 pa-1>
            <v-card height='300' style='border-radius: 8px;'>
            </v-card>
          </v-flex>
        </v-layout>
      </v-card-text>
    </v-card>
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
  mounted(){
    // DOM element where the Timeline will be attached
    var container = document.getElementById('eventsVis');

    // Create a DataSet (allows two way data-binding)
    var items = new this.$vis.DataSet([
      {id: 1, content: 'item 1', start: '2013-04-20'},
      {id: 2, content: 'item 2', start: '2013-04-14'},
      {id: 3, content: 'item 3', start: '2013-04-18'},
      {id: 4, content: 'item 4', start: '2013-04-16', end: '2013-04-19'},
      {id: 5, content: 'item 5', start: '2013-04-25'},
      {id: 6, content: 'item 6', start: '2013-04-27'}
    ]);

    // Configuration for the Timeline
    var options = { height: '100%'};

    // Create a Timeline
    var timeline = new this.$vis.Timeline(container, items, options);
    console.dir(timeline)
  },
  data: () => ({
    tday: '2019-03-14',
    showCalendar: true,
    today: '2019-01-10',
    tracked: {
      '2019-01-09': [23, 45, 10],
      '2019-01-08': [10],
      '2019-01-07': [0, 78, 5],
      '2019-01-06': [0, 0, 50],
      '2019-01-05': [0, 10, 23],
      '2019-01-04': [2, 90],
      '2019-01-03': [10, 32],
      '2019-01-02': [80, 10, 10],
      '2019-01-01': [20, 25, 10]
    },
    colors: ['#1867c0', '#fb8c00', '#000000'],
    category: ['Development', 'Meetings', 'Slacking'],
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
    },
    computedDateToFormattedMomentjs(toDate){
      return this.$moment(toDate).format('ddd, MMMM Do YYYY')
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
