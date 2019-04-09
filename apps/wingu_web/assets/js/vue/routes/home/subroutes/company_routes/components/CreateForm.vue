<template>
  <v-card dark tile>
    <v-card-title class='py-0 primary'>
      <v-progress-linear color='secondary' v-model='progress'></v-progress-linear>
    </v-card-title>
    <v-card-text class='pa-0'>
      <v-tabs
        v-model="active"
        color="secondary lighten-3"
        dark centered
        hide-slider
        >
        <v-tab :v-ripple=false
          v-for="(n, i) in wizard.sections"
          :key="i" class='text-none'
          :ripple='false'
          >
          <v-btn :flat='active!==i' round :class='active!==i ? "black--text" : "white--text" '>
            <v-icon color='green darken-2' small left>
              {{ active >= i ? "check_circle" : "close" }}
            </v-icon>
            {{ n.title }}
          </v-btn>
        </v-tab>
        <v-tab-item lazy
          v-for="(n,i) in wizard.sections"
          :key="i"
          >
          <FormWizard v-if='n.custom'/>
          <v-card v-else color='accent darken-3' tile flat pa-2>
            <v-divider />
            <v-card-text>
              <v-layout row wrap>
                <v-flex :pa-4='$vuetify.breakpoint.smAndUp' xs12 sm5 offset-sm1 8px class='text-xs-justify'>
                  <v-layout column>
                    <v-card class='mb-2' flat color='accent darken-1'>
                      <v-card-title>
                        <strong>
                          Description
                        </strong>
                      </v-card-title>
                    </v-card>
                    <v-card flat color='accent darken-1'>
                      <v-card-text>
                        {{ text }}
                      </v-card-text>
                    </v-card>
                  </v-layout>
                </v-flex>
                <v-flex xs12 sm5 px-2>
                  <v-layout column mt-4>
                    <v-flex :key='i' v-for='(o,i) in n.model' :px-4='$vuetify.breakpoint.mdAndUp'>
                      <v-layout column>
                        <v-flex v-if='!o.long'>
                          <v-text-field max='63' counter='63' color='dark' box :name='o.label' :label='o.label'>
                          </v-text-field>
                        </v-flex>
                        <v-flex v-else>
                          <v-textarea max='280' counter='280' color='dark' box name='' :label='o.label'>
                          </v-textarea>
                        </v-flex>
                      </v-layout>
                    </v-flex>
                  </v-layout>
                </v-flex>
              </v-layout>
            </v-card-text>
            <v-divider />
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn @click='next' color='amber lighten-2' flat round>
                back
              </v-btn>
              <v-btn @click='next' color='green' flat round>
                continue
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-card-text>
    <!--<v-card-actions>-->
      <!--<v-spacer></v-spacer>-->
      <!--<v-btn @click="next">next tab</v-btn>-->
      <!--</v-card-actions>-->
  </v-card>
</template>
<script charset="utf-8">
import FormWizard from './FormWizard.vue'
export default {
  name: "CreateForm",
  components: { FormWizard },
  data: () => ({
    wizard:{
      sections: [
        {title: "Form Info", custom: false, description: "...", model: [

          {label: "Name",        action: "name",        long: false},
          {label: "Summary",     action: "summary",     long: false},
          {label: "Description", action: "description", long: true},

        ]},
        {title: "Form Inputs", custom: true, description: "...", model: [
        ]},
      ]
    },
    formModel: {},
    active: 0,
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
  }),
  computed: {
    progress(){
      return ((this.active+1)/this.wizard.sections.length) * 100
    }
  },
  methods: {
    next () {
      const active = parseInt(this.active)
      this.active = (active < 2 ? active + 1 : 0)
    }
  }
}
</script>
<style type="text/css" media="screen">
.v-progress-linear__bar
{
  border-radius: 16px;
}
.v-progress-linear__bar__determinate {
  border-radius: 16px;
}
.v-progress-linear__background secondary {
  border-radius: 16px;
}
</style>
