<template>
  <v-content v-scroll='onScroll' class=''>
    <!--<v-divider -->
      <!--color='white'-->
      <!--v-if='$vuetify.breakpoint.xsOnly'-->
      <!--style='position: fixed; width: 100%;z-index: 2;'-->
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
      class='fab'
      transition="scale-transition"
      open-on-hover :close-on-content-click='false'
      right bottom
      fixed
      :class='$vuetify.breakpoint.mdAndUp ? "mb-5 mr-5" : "mb-4"'
      >
      <div
        data-aos='zoom-in' data-aos-offset='-200' data-aos-delay='400'
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
    <router-view></router-view>
    </v-content>
  </template>
  <script charset="utf-8">
export default {
  name: "CompanyView",
  data: () => ({
    fab: false,
    offsetTop: 0,
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
  max-width: 1280px;
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
