<template>
  <v-app :dark='dark' style='font-family: "Montserrat", sans-serif;'> 
    <!--:permanent='$vuetify.breakpoint.mdAndUp'-->
      <!--:fixed='$vuetify.breakpoint.mdAndUp' -->
    <v-navigation-drawer
      app fixed 
      :mini-variant="mini" 
      color='primary' v-model="drawer">
      <v-toolbar flat class="transparent">
        <v-list class="pa-0">
          <v-list-tile avatar>
            <v-list-tile-avatar>
              <img src="https://randomuser.me/api/portraits/men/85.jpg">
            </v-list-tile-avatar>

            <v-list-tile-content>
              <v-list-tile-title>John Leider</v-list-tile-title>
            </v-list-tile-content>

            <v-list-tile-action>
              <!--@click.stop="mini = !mini"-->
              <v-btn
                icon
                >
                <v-icon>chevron_left</v-icon>
              </v-btn>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>
      </v-toolbar>

      <v-list class="pt-0" dense>
        <v-divider></v-divider>

        <v-list-tile
          v-for="item in items"
          :key="item.title"
          @click=""
          >
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>

          <v-list-tile-content>
            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar flat app 
      extension-height='98' extended
      dark color="primary">
      <!--<v-toolbar-side-icon @click='drawer=!drawer'/>-->
      <!--<v-fab-transition>-->
        <!--</v-fab-transition>-->
      <v-toolbar-title>
        <v-layout column>
          <div style='text-overflow: scroll; font-family: Pacifico;font-weight: normal;font-size: 18px;'>
            <!--<strong>{{ $store.state.store.home | first }}</strong>-->
            <strong>Cerrelo Studio</strong>
          </div>
          <!--<v-divider />-->
          <!--<v-divider />-->
          <!--<span style='font-size: 12px;'>Dashboard</span>-->
        </v-layout>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <!--<v-menu-->
        <!--attach='#chat' -->
        <!--transition='slide-y-reverse-transition' -->
        <!--nudge-left='170'-->
        <!--nudge-bottom='4'-->
        <!--open-on-hover close-on-content-click offset-y>-->
        <!--<div id='chat' slot='activator'>-->
          <!--<v-btn id='chat' outline data-aos='zoom-in' data-aos-delay='200' icon round flat>-->
            <!--<v-badge color='red'>-->
              <!--<span style='font-size: 12px;' slot='badge'>23</span>-->
              <!--<v-icon small>-->
                <!--chat-->
                <!--</v-icon>-->
              <!--</v-badge>-->
            <!--</v-btn>-->
          <!--</div>-->
        <!--<div class='up-arrow'>-->
          <!--</div>-->
        <!--<v-card style='border-radius: 8px;' width='230' height='200'>-->
          <!--</v-card>-->
        <!--</v-menu>-->
        <v-btn v-if='$vuetify.breakpoint.smAndDown' data-aos='zoom-in' data-aos-delay='100' icon @click='drawer=!drawer'>
          <v-icon >
            menu
          </v-icon>
        </v-btn>
      <v-menu 
        attach='#bell' 
        transition='slide-y-reverse-transition' 
        nudge-left='170'
        nudge-bottom='4'
        open-on-hover close-on-content-click offset-y>
        <div id='bell' slot='activator' class='mr-2'>
          <v-btn  outline data-aos='zoom-in' data-aos-delay='300' icon round flat>
            <v-badge color='red'>
              <span slot='badge' style='font-size: 12px;'>6</span>
              <v-icon small>
                notifications_none
              </v-icon>
            </v-badge>
          </v-btn>
        </div>
        <div class='up-arrow'>
        </div>
        <v-card style='border-radius: 8px;' width='230' height='200'>
        </v-card>
      </v-menu>
      <v-menu
        attach='#profile' 
        transition='slide-y-reverse-transition' 
        nudge-left='180'
        nudge-bottom='3'
        open-on-click :close-on-click='false'
        open-on-hover offset-y>
        <span slot='activator' id='profile'>
          <v-btn  class='mr-1' outline data-aos='zoom-in' data-aos-delay='300' icon round flat>
            <v-badge color='red'>
              <span slot='badge' style='font-size: 12px;'>6</span>
              <v-icon small>
                settings
              </v-icon>
            </v-badge>
          </v-btn>
        </span>
        <div class='correct-up-arrow'>
        </div>
        <v-card style='border-radius: 8px;' width='230' height='200'>
          <v-card-title>
            <v-switch v-model='dark'></v-switch>
          </v-card-title>
        </v-card>
      </v-menu>
      <div style='width:100%;' slot='extension'>
        <v-card color='transparent' flat>
          <v-card-title class='pa-0' style='font-size: 32px;'>
            <strong>
              Overview
            </strong>
            <v-spacer></v-spacer>
            <v-icon>
              info
            </v-icon>
          </v-card-title>
          <v-card-actions class='pa-0'>
            <v-tabs class='pa-0' show-arrows color='primary'
              v-model="tab">
              <v-tabs-slider style='border-radius: 8px;' color="yellow"></v-tabs-slider>
              <v-tab v-for="item in items" :key="item.icon">
                {{ item.title }}
              </v-tab>
            </v-tabs>
          </v-card-actions>
        </v-card>
      </div>
    </v-toolbar>
    <v-content>
      <v-tabs-items v-model="tab">
        <v-tab-item v-for="item in items" :key="item.title">
          <v-container class='pa-0' fluid fill-height>
            <v-layout row wrap>
              <v-card flat>
                <v-card-text>
                  <p>
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                    tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
                    vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
                    no sea takimata sanctus est Lorem ipsum dolor sit amet.
                  </p>
                  <p>
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                    tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
                    vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
                    no sea takimata sanctus est Lorem ipsum dolor sit amet.
                  </p>
                  <p>
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                    tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
                    vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
                    no sea takimata sanctus est Lorem ipsum dolor sit amet.
                  </p>
                  <blockquote class='blockquote'>
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                    tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
                    vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
                    no sea takimata sanctus est Lorem ipsum dolor sit amet.
                  </blockquote>
                </v-card-text>
              </v-card>
            </v-layout>
          </v-container>
        </v-tab-item>
      </v-tabs-items>
    </v-content>
  </v-app>
</template>
<script charset="utf-8">
import Dashboard from './company_routes/Dashboard.vue'
import Records from './company_routes/Records.vue';
import Stats from './company_routes/Stats.vue'
import Integrations from './company_routes/Integrations.vue';
export default {
  name: "CompanyView",
  components: { Dashboard, Records, Stats, Integrations },
  data: () => ({
    fab: false,
    offsetTop: 0,
    dark: true,
    tab: 0,
    activeTab: 0,
    drawer: true,
    items: [
      { title: 'Home', icon: 'dashboard' },
      { title: 'Home', icon: 'account_circle' },
      { title: 'Home', icon: 'supervisor_account' },
      { title: 'Home', icon: 'fingerprint' },
      { title: 'Home', icon: 'monetization_on' },
      { title: 'Home', icon: 'folder_open' },
      { title: 'Home', icon: 'business_center' },
      { title: 'About', icon: 'question_answer' }
    ],
    mini: true,
    right: null,
    tabs: [
      {label: "Records",   icon: "folder_open"},
      {label: "Events", icon: "dashboard"},
      {label: "Messages",  icon: "message"},
    ],
    speedDialModel: [
      { action: "/", icon: "description", color: "red" },
      { action: "/", icon: "mail", color: "green" },
      { action: "/", icon: "domain", color: "teal" },
    ],
  }),
  filters: {
    first(sentence){
      return sentence.split(" ")[0]
    }
  },
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
  max-width: 1440px;
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
.circuit_hero{
}
/*.elv{
box-shadow: 0 2px 1px -1px rgba(0,0,0,.2),0 1px 1px 0 rgba(0,0,0,0),0 1px 3px 0 rgba(0,0,0,0)!important;
}*/
</style>
