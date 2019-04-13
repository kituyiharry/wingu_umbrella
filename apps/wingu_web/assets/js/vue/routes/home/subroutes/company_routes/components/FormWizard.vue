<template>
  <v-card width='100%' id='attachcard' color='accent darken-3' flat>
    <v-card-text class='pa-0'>
      <v-layout row wrap>
        <v-flex xs12>
          <v-card color='accent darken-3' flat tile min-height='382'>
            <v-card-text style='font-size: 18px;' class=''>
              <strong>
              Create a section with inputs
              </strong>
            </v-card-text>
            <v-divider />
            <v-card-text class='py-2 px-0'>
              <v-layout row style='align-items: flex-start;overflow-x: auto;'  class='px-1'>
                <!--<v-flex xs6 
                  mr-2>-->
                  <div 
                    v-for='(section,secindex) in sectionNode.sections' :key='secindex' 
                    class="py-2 px-1">
                  <v-card 
                    @click='log'
                    class='ma-0' 
                    style='border-radius: 8px;' min-height='270' min-width='330' flat tile color='accent darken-1'>
                    <v-card-title>
                      <strong style='font-size: 18px;'>
                        {{ section.name }}
                      </strong>
                    </v-card-title>
                    <v-divider />
                    <v-card-text>
                      <v-layout row wrap> 
                        <v-flex pa-1 v-for='(node,index) in section.nodes' :key='index' xs12 sm md>
                          <FormNode :node='node' :index='index' :secname='section.name' :secindex='secindex'/>
                        </v-flex>
                      </v-layout>
                    </v-card-text>
                  </v-card>
                  </div>
                <!--</v-flex>-->
              </v-layout>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-card-text>
    <v-divider />
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn color='secondary' round>
        Add Section
      </v-btn>
    </v-card-actions>
  </v-card>
</template>
<script charset="utf-8">
import FormNode from './FormNode.vue';
export default {
  name: "FormWizard",
  components: { FormNode },
  data: () => ({
    sectionNode: {
      sections: [
        {name: "Personal Information", description: "...", nodes: [
          {label: "First Name", action: "firstname", long: false},
          {label: "Last Name", action: "firstname", long: false},
        ]},
        {name: "Files", description: "...", nodes: [
          {label: "First Name", action: "firstname", long: false},
          {label: "First Name", action: "firstname", long: false},
          {label: "First Name", action: "firstname", long: false},
          {label: "First Name", action: "firstname", long: false},
          {label: "Last Name", action: "firstname", long: false},
        ]},
        {name: "Personal Information", description: "...", nodes: [
          {label: "First Name", action: "firstname", long: false},
          {label: "Last Name", action: "firstname", long: false},
          {label: "First Name", action: "firstname", long: false},
        ]},
        {name: "Personal Information", description: "...", nodes: [
          {label: "First Name", action: "firstname", long: false},
          {label: "Last Name", action: "firstname", long: false},
        ]},
      ]
    }
  }),
  methods: {
    log(e){
      e.target.focus()
    },
    createSimpleID(nodeLabel, index, sectionIndex, sectionName){
      return sectionIndex.toString().concat(sectionName.concat(index.toString().concat(nodeLabel)))
    }
  }
}
</script>
<style type="text/css" media="screen">
</style>
