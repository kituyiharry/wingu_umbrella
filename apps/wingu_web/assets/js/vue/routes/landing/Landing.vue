<template>
  <v-app style='font-family: "Montserrat", sans-serif;'>
    <v-toolbar color='#8a77a2dd' class='elevation-0' 
      height='80'
      app dark prominent fixed
      >
      <v-avatar data-aos='zoom-in' data-aos-delay='400' size='36'>
        <img src='/images/sahihi.png' alt=''>
      </v-avatar>
      <v-toolbar-title class='noselect' style='font-family: "Raleway", sans-serif; font-size:24px;'>
        {{name}}
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn 
        v-if='$vuetify.breakpoint.smAndUp'
        round flat outline data-aos='fade-left'>
        <v-icon left small>
          person_add
        </v-icon>
        <strong>join</strong>
      </v-btn>
      <v-btn 
        v-if='$vuetify.breakpoint.xsOnly'
        icon flat outline
        data-aos='zoom-in'
        >
        <v-icon small>
          menu
        </v-icon>
      </v-btn>
    </v-toolbar>
    <v-content class=''>
      <!--TODO: Link image creator-->
      <v-img
        class="white--text"
        :height="$vuetify.breakpoint.smAndDown ? '300px' : '500px'"
        gradient="to top right, rgba(100,115,201,.33), rgba(25,32,72,.7)"
        src="/images/doc.png"
        >
        <v-container fill-height fluid>
          <v-layout
            :class='$vuetify.breakpoint.mdAndUp ? "pa-5" : ""'
            align-center
            column
            justify-center
            >
            <h2 data-aos='fade-up' data-aos-delay='400' class="display-2 font-weight-thin mb-3 text-xs-center">A modern way to experience services</h2>
            <!--<v-divider />-->
            <h4 data-aos='fade-up' data-aos-delay='500' class="subheading">Build your application today!</h4>
            <v-btn dark class='mt-5 elevation-0' 
              color='#8a77a2' v-if='!$vuetify.breakpoint.smAndUp'
              round data-aos='fade-up' data-aos-delay='800'>
              <v-icon left small>
                person_add
              </v-icon>
              <strong>join</strong>
            </v-btn>
          </v-layout>
        </v-container>
      </v-img>
      <v-container fluid fill-height>
        <v-layout row wrap> 
          <v-flex xs12>
            <v-card flat tile hover>
              <v-card-title>
                <span class='headline'>
                  Skip
                </span>
              </v-card-title>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>
<script charset="utf-8">
export default{
  name: 'Landing',
  data: () => ({
    name: "Sahihisha",
    lorem: `Lorem ipsum dolor sit amet, mel at clita quando. Te sit oratio vituperatoribus, nam ad ipsum posidonium mediocritatem, explicari dissentiunt cu mea. Repudiare disputationi vim in, mollis iriure nec cu, alienum argumentum ius ad. Pri eu justo aeque torquatos.`
  }),
}
</script>
<style type="text/css" media="screen">
noselect{
  user-select: none;
}
</style>
