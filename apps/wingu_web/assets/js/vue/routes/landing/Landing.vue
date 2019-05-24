<template>
  <v-app style='font-family: "Montserrat", sans-serif;'>
    <v-toolbar color='#996fd6' 
      :class='$vuetify.breakpoint.xsOnly ? "elevation-1" : "elevation-1"' 
      height='80' app dark prominent fixed>
      <v-avatar data-aos='zoom-in' data-aos-delay='400' size='42'>
        <img src='/images/sahihi.png' alt=''>
      </v-avatar>
      <v-toolbar-title 
        clipped-left
        class='noselect' style='font-family: "Pacifico", sans-serif; font-size:32px;font-weight: regular;'>
        {{name}}
      </v-toolbar-title>
      <span
        id='attached'
        class='ml-5'
        v-if='$vuetify.breakpoint.mdAndUp' 
        >
        <v-menu v-for='(panel, index) in panels' :key='index'
          attach='#attached'
          ref='panel.name'
          transition='slide-y-reverse-transition'
          :open-on-hover='true'
          :close-on-content-click="false"
          :nudge-width="200"
          nudge-bottom="5"
          style="border-radius:8px;"
          offset-y
          >
          <v-btn slot='activator' class='text-none' 
            data-aos='fade-left'
            :data-aos-delay='index*100'
            flat round>
            <strong>{{panel.name}}</strong>
            <v-icon small right>
              arrow_drop_down
            </v-icon>
          </v-btn>
            <div class='up-arrow'>
            </div>
            <v-card flat style='border-radius: 8px;font-family:"Montserrat", sans-serif;' width='350'>
              <v-card-title style='font-weight:600;'>
                <v-btn color='purple' icon small flat outline>
                  <v-icon color='purple lighten-1' small>
                    {{ panel.action }}
                  </v-icon>
                </v-btn>
                {{ panel.subname }}
              </v-card-title>
              <v-divider />
              <v-card-text>
                <v-layout row wrap>
                  <v-flex xs5>
                    <v-list dense>
                      <v-list-tile 
                        v-for='(sub,index) in panel.submodels' :key='index'>
                        <v-list-tile-content>
                          <!--<v-list-tile-title style='font-size: 14px;'>{{ sub.item }}</v-list-tile-title>-->
                          <a style='font-size: 14px;'>{{ sub.item }}</a>
                        </v-list-tile-content>
                      </v-list-tile>
                    </v-list>
                  </v-flex>
                  <v-flex xs7 class='text-xs-left' style='font-size: 12px;'>
                    {{ panel.description }}
                  </v-flex>
                </v-layout>
              </v-card-text>
            </v-card>
        </v-menu>
      </span>
      <v-spacer></v-spacer>
      <v-btn 
        v-if='$vuetify.breakpoint.mdAndUp'
        href="/auth/google"
        round flat outline data-aos='fade-left'>
        <v-icon data-aos='zoom-in' left small>
          person_add
        </v-icon>
        <strong>join</strong>
      </v-btn>
      <v-btn 
        @click='drawer=!drawer'
        v-if='$vuetify.breakpoint.smAndDown'
        icon flat outline
        data-aos='zoom-in'>
        <v-icon small>
          menu
        </v-icon>
      </v-btn>
    </v-toolbar>
    <v-navigation-drawer width='300' v-if='$vuetify.breakpoint.smAndDown' app right clipped v-model='drawer'>
      <v-card height='80' flat>
      </v-card>
      <v-toolbar height='80' dark color='primary' flat absolute>
        <v-toolbar-title>
        Options
        </v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn icon small flat outline @click='drawer=false'>
          <v-icon small>
            close
          </v-icon>
        </v-btn>
      </v-toolbar>
      <v-list dense expand>
        <v-list-group
          v-for='(panel,index) in panels'
          :key='index'
          :prepend-icon="panel.action"
          value="true"
          >
          <v-list-tile slot='activator'>
            <v-list-tile-content>
              <v-list-tile-title> <strong>{{ panel.name }}</strong></v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
          <v-list-tile v-for="(sub,i) in panel.submodels" :key='i'>
            <v-list-tile-action>
              <v-icon small>
                {{ sub.action }}
              </v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>
                {{ sub.item }}
              </v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </v-list-group>
      </v-list>
    </v-navigation-drawer>
    <v-content>
      <!--TODO: Link image creator-->
      <v-divider color='#996fd6'/>
      <v-card dark flat tile height='470' color='#996fd6'>
        <v-img v-if='$vuetify.breakpoint.smAndDown'
          src="/images/doc.png"
          lazy-src="/images/doc.png"
          height="470"
          gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0, .7), rgba(0,0,0,1)"
          >
          <template v-slot:placeholder>
            <v-layout
              fill-height
              align-center
              justify-center
              ma-0>
              <v-progress-circular indeterminate color="orange"></v-progress-circular>
            </v-layout>
          </template>
          <v-layout row wrap fill-height d-flex align-center justify-content-center>
            <v-flex xs12>
              <h1 data-aos='fade' class='text-xs-center mx-5' style='font-size:3.26em;'> 
                Scale your business
              </h1>
              <h3 data-aos='fade' data-aos-delay='200' class='text-xs-center mx-3'>
                Read the words in reverse, over and over again
              </h3>
              <span data-aos='flip-left' data-aos-delay='250' data-aos-offset='-200'
                style='display:flex; align-items:center; justify-content: center'
                class='mt-5'>
                <v-btn @click='$router.push("/home")' color='deep-orange' round >
                  <v-icon left>
                    group_add
                  </v-icon>
                  <strong>
                    get started
                  </strong>
                </v-btn>
              </span>
              <span class='mt-4' style='display:flex; align-items:center; justify-content: center'>
                <v-icon 
                  data-aos='zoom-in' :data-aos-delay='(index+1)*100' data-aos-offset='-200' class='mx-1' 
                  v-for='(icon,index) in ["mail", "gesture", "attachment", "cloud" ]' :key='icon'>
                  {{ icon }}
                </v-icon>
              </span>
            </v-flex>
          </v-layout>
        </v-img>
        <v-card-text v-else class='mycontent'>
          <v-container fluid>
            <TitleBox />
          </v-container>
        </v-card-text>
      </v-card>
      <v-container class='mycontent' fluid fill-height>
        <v-layout row wrap> 
          <v-flex xs12 md6 offset-md3>
            <v-card color='transparent' flat tile>
              <v-card-text data-aos='fade-up' data-aos-delay='100' class='text-xs-center'>
                <h2 :style='$vuetify.breakpoint.xsOnly ? "" : "font-size: 2.125em;"'>
                  Improve your services with modern cloud workflows
                </h2>
              </v-card-text>
              <v-divider/>
              <v-card-text data-aos='fade-up' data-aos-delay='200' class='text-xs-center pa-3'>
                {{ lorem }}
              </v-card-text>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>
<script charset="utf-8">
import TitleBox from './compenents/TitleBox.vue';
export default{
  name: 'Landing',
  mounted(){
  },
  components: {TitleBox},
  data: () => ({
    name: "Cerello",
    menu: false,
    drawer: false,
    lorem: `Lorem ipsum dolor sit amet, mel at clita quando. Te sit oratio vituperatoribus, nam ad ipsum posidonium mediocritatem, explicari dissentiunt cu mea. Repudiare disputationi vim in, mollis iriure nec cu, alienum argumentum ius ad. Pri eu justo aeque torquatos.`,
    panels: [
      {name:  "Forms", action: "subject", subname: "Collect and organize information", 
        description: "Create documents to gather data relevant to your business",
        submodels: [
          {item: "Create",    route: "", action: "create_new_folder"},
          {item: "Share",    route: "", action: "share"},
          {item: "Retrieve", route: "", action: "get_app"},
        ]},
      {name: "Engage", action: "forum", subname: "Engage with your clients", 
        description: "Effectively communicate messages with your clients or staff",
        submodels: [
          {item: "Lobbies", route: "", action: "event_seat"},
          {item: "Mail", route: "", action: "mail"},
        ]},
      {name: "Finance", action: "credit_card", subname: "Process payments efficiently", 
        description: "Apply modern mobile payment processing workflows to your business",
        submodels: [
          {item: "Payments", route: "", action: "attach_money"}
        ]},
      {name: "Develop", action: "developer_mode", subname: "Build integrations", 
        description: "Create templates and document able to display information on related data",
        submodels: [
          {item: "Coming soon", route: "", action: "timelapse"}
        ]}
    ]
  }),
  methods: {
    drop(_e, targetID){
      document.getElementById(targetID).classList.toggle("show");
    }
  }
}
</script>
<style scoped type="text/css" media="screen">
.up-arrow {
  border-color: white transparent;
  border-style: solid;
  border-width: 0px 7px 7px 7px;
  margin-left: 10px;
  height: 0px;
  width: 0px;
}

.mycontent{
  max-width: 1440px;
  margin-left: auto;
  margin-right: auto;
}
.v-toolbar__content{
  max-width: 1440px;
  margin: auto;
}
.v-menu__content{
  box-shadow: 0 5px 5px -3px rgba(0,0,0,.2), 0 8px 10px 1px rgba(0,0,0,0.12), 0 3px 14px 2px rgba(0,0,0,0);
}
</style>
