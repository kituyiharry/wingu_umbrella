<template>
  <v-card width='100%' id='attachcard' color='accent darken-3' flat>
    <v-card-text class='pa-0'>
      <v-layout row wrap>
        <v-flex xs12>
          <v-card color='accent darken-3' flat tile min-height='382'>
            <v-card-text style='font-size: 24px;' class=''>
              <strong>
              Create a section with inputs
              </strong>
            </v-card-text>
            <v-divider />
            <v-card-text class='py-2 px-0'>
              <v-layout row style='align-items: flex-start;overflow-x: auto;scroll-direction: horizontal;'  class='px-1'>
                  <div v-for='(section,secindex) in sectionNode.sections' :key='secindex' class="py-2 px-1">
                    <SectionNode @handleRemoveSection='handleRemoveSection' @handleRemove='handleRemoveNode' @handleSectionMenu='handleSectionMenu' :section='section' :secindex='secindex'/>
                  </div>
              </v-layout>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-card-text>
    <v-divider />
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn @click='handleAddSection' color='secondary' round>
        Add Section
      </v-btn>
    </v-card-actions>
  </v-card>
</template>
<script charset="utf-8">
import SectionNode from './SectionNode.vue';
export default {
  name: "FormWizard",
  components: { SectionNode },
  data: () => ({
    editMode: false,
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
    },
    handleSectionMenu(actionSwitch, index){
      switch (actionSwitch) {
        case 'add':
          this.handleAddNode(index)
          break;
        case 'delete':
          this.handleRemoveSection(index)
          break;
        case 'edit':
          this.editSection(index)
          break;
        default:
          return null
      }
    },
    editSection(){
      this.editMode = !this.editMode
    },
    handleAddSection(){
      return this.sectionNode.sections.splice(this.sectionNode.sections.length, 0, {
        name: "New Section", description: "...", nodes: []
      })
    },
    handleAddNode(sectionIndex){
      return this.sectionNode.sections[sectionIndex].nodes.splice(0, 0, 
        {label: "A label", action: "action", long: false}
      )
    },
    handleRemoveSection(index){
      return this.sectionNode.sections.splice(index, 1)
    },
    handleRemoveNode(nodeData){
      return this.sectionNode.sections[nodeData.sec].nodes.splice(nodeData.ind, 1)
    }
  }
}
</script>
<style type="text/css" media="screen">
::-webkit-scrollbar {
  width: 4px;
  height: 4px;
}
/* Track */
::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  -webkit-border-radius: 4px;
  border-radius: 4px;
}

/* Handle */
::-webkit-scrollbar-thumb {
  -webkit-border-radius: 4px;
  border-radius: 4px;
  background: rgba(223,173,145,0.8);
  -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,0.5);
}
::-webkit-scrollbar-thumb:window-inactive {
  background: rgba(223,173,145,0.4);
}
.up-arrow {
  border-color: #f5ff8d transparent;
  border-style: solid;
  border-width: 0px 7px 7px 7px;
  margin-left: 187px;
  height: 0px;
  width: 0px;
}
</style>
