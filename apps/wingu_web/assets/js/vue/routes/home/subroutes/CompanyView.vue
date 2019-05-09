<template>
  <v-content v-scroll='onScroll' class=''>
    <div data-aos='fade-down'>
      <v-tabs
        centered dark :hide-slider='false' v-model='activeTab'
        align-with-title
        color="primary darken-1" :class='offsetTop > 25 ? "elv" : "elevation-0"'
        style='position: fixed;width: 100%;z-index: 1;'
        slider-color="secondary lighten-2">
        <v-tab :ripple='false' v-for="(n,ind) in tabs" :key="ind">
          <v-btn :color='(activeTab==ind) ? "secondary lighten-3" : "white lighten-3"' 
            class='black--text' 
            depressed :flat='!(activeTab==ind)' round>
            <v-icon left small>
              {{ n.icon }}
            </v-icon>
            {{ n.label }}
          </v-btn>
        </v-tab>
      </v-tabs>
    </div>
    <!--<v-divider/>-->
    <v-speed-dial
      v-model="fab" direction="top" class='fab' transition="scale-transition"
      open-on-hover right bottom fixed
      :close-on-content-click='false' :class='$vuetify.breakpoint.mdAndUp ? "mb-5 mr-5" : "mb-4"'>
      <div slot="activator" data-aos='zoom-in' data-aos-offset='-200' data-aos-delay='400'>
        <v-btn color="secondary" id='fab' fab icon class='elevation-1' v-model="fab">
          <v-icon>
            {{ !fab ? "open_in_browser" : "close" }}
          </v-icon>
        </v-btn>
      </div>
      <v-btn
        v-for='(i,ind) in speedDialModel' :key='ind'  data-aos='fade-left' :data-aos-delay='ind * 25' 
        :id='"btn_dial_".concat(ind)' dark round icon large :color='i.color'>
        <v-icon small>
          {{ i.icon }}
        </v-icon>
      </v-btn>
    </v-speed-dial>
      <v-tabs-items v-model="activeTab">
        <v-tab-item>
          <router-view></router-view>
        </v-tab-item>
        <v-tab-item>
          <Records/>
        </v-tab-item>
        <v-tab-item>
          <Stats />
        </v-tab-item>
        <v-tab-item>
          <Integrations />
        </v-tab-item>
      </v-tabs-items>
    </v-content>
  </template>
  <script charset="utf-8">
import Records from './company_routes/Records.vue';
import Stats from './company_routes/Stats.vue'
import Integrations from './company_routes/Integrations.vue';
export default {
  name: "CompanyView",
  components: { Records, Stats, Integrations },
  data: () => ({
    fab: false,
    offsetTop: 0,
    activeTab: 0,
    tabs: [
      {label: "Dashboard", icon: "dashboard"},
      {label: "Records",   icon: "folder_open"},
      {label: "Stats",     icon: "multiline_chart"},
      {label: "Integrations",     icon: "power"},
    ],
    speedDialModel: [
      { action: "/", icon: "description", color: "red" },
      { action: "/", icon: "mail", color: "green" },
      { action: "/", icon: "domain", color: "teal" },
    ],
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
.elv{
  box-shadow: 0 2px 1px -1px rgba(0,0,0,.2),0 1px 1px 0 rgba(0,0,0,0),0 1px 3px 0 rgba(0,0,0,0)!important;
}
</style>
