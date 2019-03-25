<template>
  <v-container fluid :class='$vuetify.breakpoint.smAndDown ? "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-layout data-aos='fade-up' row wrap fill-height>
      <v-flex xs12 sm8 md6>
        <!--style='max-height:286px; overflow-y: auto;'-->
        <!--:full-width='$vuetify.breakpoint.lgAndDown'-->
        <v-date-picker
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
                  color='primary' height='150' :width='$vuetify.breakpoint.xsOnly ? 250 : ""'>
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
            <v-card-text 
              :style='$vuetify.breakpoint.smAndDown 
              ? "height: 200px; overflow-y: auto;" : "max-height: 430px; overflow-y: auto;"'
              >
              <v-layout row :wrap='!$vuetify.breakpoint.xsOnly'>
                <v-flex v-for='i in 8' :key='i' :pa-1='$vuetify.breakpoint.mdAndUp' xs12 sm4 md3 d-flex align-center justify-content-center>
                  <v-card style='border-radius: 8px;' hover
                    :class='$vuetify.breakpoint.smAndDown? "mr-1 my-1" : "my-1"' 
                    color='primary' height='150' :width='$vuetify.breakpoint.xsOnly ? 250 : ""'>
                  </v-card>
                </v-flex>
              </v-layout>
            </v-card-text>
            <v-divider />
            <v-card-actions>
              <!--<v-spacer></v-spacer>-->
              <v-btn @click='$router.push("/forms")' round outline small>
                new
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
 </template>
<script charset="utf-8">
export default{
  name: "Dashboard",
  data: () => ({
    tday: '2019-03-14',
    events: [
      '2019-03-14',
      '2019-03-12',
      '2019-03-22',
      '2019-03-2',
    ],
    calMenu: false,
    documentClasses: [
      {docClass: "Academic", subs: [ 
        {name: "", summary: ""}, {name: "", summary: ""}
      ]},
      {docClass: "Legal", subs: [ 
        {name: "", summary: ""}, {name: "", summary: ""},
        {name: "", summary: ""}, {name: "", summary: ""},
        {name: "", summary: ""}, {name: "", summary: ""},
        {name: "", summary: ""}, {name: "", summary: ""},
      ]},
      {docClass: "Medical", subs: [ 
        {name: "", summary: ""}, {name: "", summary: ""}
      ]},
    ],
  })
}
</script>
<style scoped type="text/css" media="screen">
.v-card--hover:hover {
  transform: translateY(-7.5px);
}
</style>
