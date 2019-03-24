<template>
  <v-content v-scroll='onScroll' class=''>
    <!--<v-divider -->
      <!--color='white'-->
      <!--v-if='$vuetify.breakpoint.xsOnly'-->
      <!--style='position: fixed; width: 100%;z-index: 1;'-->
      <!--/>-->
    <div 
        data-aos='fade-down'
      >
      <v-tabs
        centered
        color="primary" :class='offsetTop > 25 ? "elv" : "elevation-0"'
        dark 
        style='position: fixed; width: 100%;z-index: 1;'
        slider-color="white"
        >
        <v-tab
          v-for="(n,ind) in speedDialModel"
          :key="ind"
          :active='2'
          >
          <v-icon class='mx-2' small>
            {{ n.icon }}
          </v-icon>
          Item {{ ind }}
        </v-tab>
      </v-tabs>
    </div>
    <v-divider v-if='$vuetify.breakpoint.smAndDown'/>
    <v-speed-dial
      v-model="fab"
      direction="top"
      transition="scale-transition"
      open-on-hover :close-on-content-click='false'
      right bottom
      fixed
      :class='$vuetify.breakpoint.mdAndUp ? "mb-5 mr-5" : ""'
      >
      <div
        data-aos='zoom-in' data-aos-offset='-200' data-aos-delay='200'
        slot="activator"
        >
        <v-btn
          color="secondary" id='fab'
          fab icon class='elevation-1'
          v-model="fab"
          >
          <v-icon>
            {{ !fab ? "open_in_browser" : "close" }}
          </v-icon>
        </v-btn>
      </div>
      <v-btn
        v-for='(i,ind) in speedDialModel' :key='ind'  
        data-aos='fade-left' :data-aos-delay='ind * 25' 
        :id='"btn_dial_".concat(ind)'
        dark round icon 
        large :color='i.color'>
        <v-icon small>
          {{ i.icon }}
        </v-icon>
      </v-btn>
    </v-speed-dial>
    <v-container fluid :class='$vuetify.breakpoint.smAndDown ? "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
      <v-layout row wrap fill-height>
        <v-flex xs12 sm8 md6>
          <!--style='max-height:286px; overflow-y: auto;'-->
          <!--:full-width='$vuetify.breakpoint.lgAndDown'-->
          <v-date-picker
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
              <strong>Events</strong>
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
                <v-flex v-for='i in 3' :key='i' :pa-1='$vuetify.breakpoint.mdAndUp' xs12 md6 d-flex align-center justify-content-center>
                  <v-card style='border-radius: 8px;' hover
                    :class='$vuetify.breakpoint.xsOnly ? "mr-1 my-1" : "my-1"' 
                    color='primary' height='150' :width='$vuetify.breakpoint.xsOnly ? 250 : ""'>
                  </v-card>
                </v-flex>
              </v-layout>
            </v-card-text>
          </v-card>
        </v-flex>
        <v-flex v-for='(i,ind) in 3' :key='ind' xs12 sm6 md4>
          <v-card>
            <v-divider/>
            <v-card-title class='mytitle'>
              <v-btn small icon round color='secondary'>
                <v-icon small>
                  description
                </v-icon>
              </v-btn>
              <strong>Forms</strong>
            </v-card-title>
            <v-divider />
            <v-card-text class='text-xs-justify'>
              Material is an adaptable system of guidelines, components, and tools that support the best practices of user interface design. 
            </v-card-text>
            <v-divider />
            <v-card-text>
              <v-layout row wrap>
                <v-flex xs12 text-xs-center>
                  No forms available, create one!
                </v-flex>
              </v-layout>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>
<script charset="utf-8">
export default {
  name: "CompanyView",
  data: () => ({
    tday: '2019-03-14',
    events: [
      '2019-03-14',
      '2019-03-12',
      '2019-03-22',
      '2019-03-2',
    ],
    calMenu: false,
    fab: false,
    offsetTop: 0,
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
    speedDialModel: [
      { action: "/", icon: "description", color: "red" },
      { action: "/", icon: "mail", color: "green" },
      { action: "/", icon: "domain", color: "teal" },
    ]
  }),
  methods: {
    log(e){
      alert(e)
    },
    onScroll(e){
      this.offsetTop = e.target.scrollingElement.scrollTop;
    }
  }
}
</script>
<style scoped type="text/css" media="screen">
.mygradient{
  /*background-image: linear-gradient(to bottom, #00000b00, #dc4225aa);*/
  max-width: 1024px;
  margin-left: auto;
  margin-right: auto;
}
.mytitle{
  font-size: 16px;
}
.v-picker.v-card{
  border-top-right-radius: 0px;
  border-top-left-radius: 0px;
}
.v-card--hover:hover {
  transform: translateY(-7.5px);
}
.elv{
  box-shadow: 0 2px 1px -1px rgba(0,0,0,.2),0 1px 1px 0 rgba(0,0,0,0),0 1px 3px 0 rgba(0,0,0,0)!important;
}
</style>
