<template>
  <v-app :dark='dark' style='font-family: "Montserrat", sans-serif;'> 
    <v-navigation-drawer
      app 
      :permanent='$vuetify.breakpoint.mdAndUp'
      :fixed='$vuetify.breakpoint.mdAndUp' 
      :mini-variant="mini" 
      color='primary' v-model="drawer">
      <!--<v-layout fill-height>-->
        <!--<v-navigation-drawer-->
          <!--dark-->
          <!--:mini-variant.sync="mini" -->
          <!--value="true">-->
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
                  <v-btn
                    icon
                  @click.stop="mini = !mini"
                    >
                    <v-icon>chevron_left</v-icon>
                  </v-btn>
                </v-list-tile-action>
              </v-list-tile>
            </v-list>
          </v-toolbar>
          <v-list class="pt-0" dense>
            <v-divider></v-divider>
            <v-list-group v-for='(route, i) in navigationTree'
              :prepend-icon="route.icon" :key='route.name'
              :value="true" :group='route.lead'>
              <template v-slot:activator>
                <v-list-tile>
                  <v-list-tile-title>{{ route.name }}</v-list-tile-title>
                </v-list-tile>
              </template>
              <v-tooltip :disabled='$vuetify.breakpoint.smAndDown' light close-delay='200' right transition='scale-transition'
                v-for="(item,ind) in route.routes"
                :key="item.icon">
                <v-list-tile active-class='secondary--text lighten-3' slot='activator' @click='()=>{setAndPush(i,item)}' :to='item.route'>
                  <v-list-tile-action>
                    <div data-aos-offset='-1000000' data-aos='zoom-in' :data-aos-delay='ind*100'>
                      <v-icon small>{{ item.icon }}</v-icon>
                    </div>
                  </v-list-tile-action>

                  <v-list-tile-content>
                    <v-list-tile-title>{{ item.name}}</v-list-tile-title>
                  </v-list-tile-content>
                </v-list-tile>
                <span>
                  {{ item.name }}
                </span>
              </v-tooltip>
            </v-list-group>
          </v-list>
        </v-navigation-drawer>
        <!--</v-layout>-->
      <!--</v-navigation-drawer>-->
    <v-toolbar height='64' flat app 
      :scroll-off-screen='$vuetify.breakpoint.xsOnly' extension-height='102' extended
      dark color="primary">
      <!--<v-toolbar-side-icon @click='drawer=!drawer'/>-->
      <!--<v-fab-transition>-->
        <!--</v-fab-transition>-->
      <v-toolbar-title>
        <v-layout column>
          <div style='text-overflow: scroll; font-family: Pacifico;font-weight: normal;font-size: 20px;'>
            <!--<strong>{{ $store.state.store.home | first }}</strong>-->
            <strong>Cerrelo Studio</strong>
          </div>
          <!--<v-divider />-->
          <!--<v-divider />-->
          <!--<span style='font-size: 12px;'>Dashboard</span>-->
        </v-layout>
      </v-toolbar-title>
      <v-spacer></v-spacer>
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
              <span slot='badge' style='font-size: 12px;'>3</span>
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
          <v-card-title class='pa-0' style='font-size: 36px;'>
            <strong>
              {{ navigationTree[activeGroup].name }}
            </strong>
            <v-spacer></v-spacer>
            <v-icon>
              info
            </v-icon>
          </v-card-title>
          <v-card-actions class='pa-0'>
            <v-tabs class='pa-0' color='primary'
              v-model="tab">
              <v-tabs-slider style='border-radius: 8px;' color="yellow"></v-tabs-slider>
              <v-tab 
                v-for="(route,ind) in navigationTree[activeGroup].routes" :key="ind"
                :to='route.route' :ripple='false'>
                <v-btn round small :flat='tab!=route.route' :class='tab==route.route ? "secondary lighten-3 black--text" : ""'>
                  {{ route.name }}
                </v-btn>
              </v-tab>
            </v-tabs>
          </v-card-actions>
        </v-card>
      </div>
    </v-toolbar>
    <v-content class='primary'>
      <transition name='slide-fade' mode='out-in'>
        <router-view/>
      </transition>
    </v-content>
  </v-app>
</template>
<script charset="utf-8">
//import Dashboard from './company_routes/Dashboard.vue'
//import Records from './company_routes/Records.vue';
//import Stats from './company_routes/Stats.vue'
//import Integrations from './company_routes/Integrations.vue';
export default {
  name: "CompanyView",
  //components: { Dashboard, Records, Stats, Integrations },
  mounted(){
    if (this.$vuetify.breakpoint.smAndDown) {
      this.$nextTick(()=>{
        this.mini = false
      }) 
    }
  },
  data: () => ({
    fab: false,
    offsetTop: 0,
    dark: true,
    tab: 0,
    activeTab: 0,
    drawer: true,
    links: ['Home', 'Contacts', 'Settings'],
    navigationTree: [
      {
        name: "Home", lead: "/i", icon: "home", routes: [
          {name: "Overview",    icon: "dashboard",           route: "/i/overview"},
          {name: "Profile",     icon: "account_circle",      route: "/i/profile"},
          {name: "Permissions", icon: "supervisor_account",  route: "/i/perms"}
        ],
      },
      {
        name: "Records", lead: "/records", icon: "folder_open", routes: [
          {name: "Workflows",   icon: "work",       route: "/records/groups"},
          {name: "Viewer",      icon: "note",       route: "/records/view"},
          {name: "Editor",      icon: "wrap_text",  route: "/records/edit"}
        ]
      },
      {
        name: "Events", lead: "/events", icon: "redeem", routes: [
          {name: "Upcoming",    icon: "event_available",   route: "/events/up"},
          {name: "Ticketing",   icon: "event_seat",        route: "/events/tickets"},
        ]
      },
      {
        name: "Monetization", lead: "/money", icon: "payment", routes: [
          {name: "Institutions", icon: "domain",     route: "/money/finance"},
          {name: "Statistics",   icon: "data_usage", route: "/money/stats"},
        ]
      }
    ],
    activeGroup: 0,
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
    setAndPush(index, route){
      this.$nextTick((i)=>{
        this.activeGroup=index
        this.tab=route.route 
      })
      //this.$router.push(route.route)
    },
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
