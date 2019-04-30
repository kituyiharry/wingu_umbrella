<template>
  <v-container fluid :class='$vuetify.breakpoint.smAndDown ? "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <div data-aos='fade-up'>
      <v-layout v-if='!$apollo.queries.docclassinfo.loading' row wrap>
        <v-flex xs12>
          <v-card dark class='white--text' color="primary">
            <v-card-title style='font-size: 24px;'>
              <v-btn small icon outline round>
                <v-icon small>
                  description
                </v-icon>
              </v-btn>
              <v-layout column>
                <span class='mytitle'>
                  <strong> {{ docclass.classname }}</strong>
                </span>
                <span class='my_sub_header'>{{ docclass.forms.length }} Documents</span>
              </v-layout>
            </v-card-title>
          </v-card>
        </v-flex>
        <v-flex xs12>
          <v-card flat tile>
            <v-divider />
            <v-card-title class='primary white--text'>
              <v-slide-y-transition hide-on-leave>
                <span class='ml-1' v-show='createCard' style='font-size: 18px;' >
                  <strong>
                    Add new Form
                  </strong>
                </span>
              </v-slide-y-transition>
              <v-spacer></v-spacer>
              <!--@mouseenter='createCard=true' -->
              <!--@mouseleave='createCard=false' -->
              <v-btn :ripple='false' :v-ripple='false' class='elevation-2' dark :icon='createCard' :color='createCard ? "red" : "secondary"' 
                @click='createCard=!createCard' 
                :round='!createCard'>
                {{ createCard ? "" : "create" }}
                <v-icon :right='!createCard' small>
                  {{ createCard ? "close" : "add" }}
                </v-icon>
              </v-btn>
            </v-card-title>
            <v-divider />
            <!--<v-slide-y-transition hide-on-leave>-->
              <!--<transition name='slide-fade' mode='out-in'>-->
                <v-expand-transition>
                  <v-card-text class='pa-0' v-show='createCard'>
                    <CreateForm />
                  </v-card-text>
                </v-expand-transition>
                <!--</transition>-->
              <!--</v-slide-y-transition>-->
            <v-divider />
          </v-card>
        </v-flex>
        <v-flex xs12 sm6 md7>
          <v-card :flat='$vuetify.breakpoint.xsOnly'>
            <v-card-title>
              <v-btn icon small outline>
                <v-icon small>
                  folder_shared
                </v-icon>
              </v-btn>
              <v-layout column >
                <span class='mytitle'> 
                  <strong>Your Forms</strong>
                </span>
                <span class='my_sub_header'>10 Document classes</span>
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
            <v-card-text 
              :style='$vuetify.breakpoint.smAndDown 
              ? "height: 200px; overflow-y: auto;" : "height: 300px; overflow-y: auto;"'
              >
              <v-layout fill-height row :wrap='!$vuetify.breakpoint.xsOnly'>
                <v-flex v-for='i in docclass.forms' :key='i.id' :pa-1='$vuetify.breakpoint.mdAndUp' xs12 sm12 md6 lg4>
                  <FormCard :form='i'/>
                </v-flex>
              </v-layout>
            </v-card-text>
            <v-divider />
          </v-card>
        </v-flex>
        <v-flex xs12 sm6 md5>
          <v-card>
            <v-card-title>
              <v-btn icon outline round small>
                <v-icon small>
                  view_compact
                </v-icon>
              </v-btn>
              <span class='mytitle'>
                <strong>Preview</strong>
              </span>
            </v-card-title>
            <v-divider />
            <v-card-text :style='$vuetify.breakpoint.mdAndUp ? "height:358px;" :  ""'>
            </v-card-text>
          </v-card>
        </v-flex>
        <v-flex xs12>
          <v-card >
            <v-card-actions>
              <v-btn flat small outline round>
                Switch
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
      <v-layout v-else column wrap>
        <v-flex xs12>
          <v-progress-linear indeterminate />
        </v-flex>
      </v-layout>
    </div>
  </v-container>
</template>
<script charset="utf-8">
import FormCard from './components/FormCard.vue'
import CreateForm from './components/CreateForm.vue'
import { DOCFORM } from "../../../../graphql/queries.js"
export default {
  name: "Forms",
  components: { FormCard, CreateForm },
  data: () => ({
    selectedCard: true,
    createCard: false,
    docclassinfo: {}
  }),
  computed: {
    docclass: {
      get(){
        return this.$store.state.store.docclass
      }
    }
  },
  apollo: {
    docclassinfo: {
      query: DOCFORM,
      variables () {
        return {
          ID: this.$route.params.docclass
        }
      },
      update(data){
        this.$store.dispatch("prepareDocumentClass", data.docclassinfo)
      }
    }
  }
}
</script>
<style type="text/css" media="screen">
.my_sub_header{
  font-size: 12px;
}
.v-card--hover{
  border-radius: 8px;
  background-color: #61045fff;
  background-image: linear-gradient(to bottom, #AA076BFF, #61045F00);
}
.v-card--hover:hover{
  background-color: #aa076bff;
  transform: translateY(-7.5px);
}

.slide-fade-enter-active {
  transition: transform opacity 1s ease-in;
}
.slide-fade-leave-active {
  /*transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);*/
  transition: opacity 1s ease-out;
}
.slide-fade-leave {
  opacity: 0;
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
transform: translateY(-20px);
opacity: 1;
}
</style>
