<template>
  <v-card dark width='100%' id='attachcard' color='primary darken-1' flat style='border-radius: 8px;'>
    <v-card-text class='pa-0'>
      <v-layout fill-height row wrap>
        <v-flex xs12>
          <v-card color='primary darken-3' flat tile min-height='380'>
            <v-card-title style='font-size: 24px;' class=''>
              <strong>
                Create sections 
              </strong>
              <v-spacer></v-spacer>
              <v-btn @click='handleAddSection' flat>
                <v-icon left small>
                  note_add
                </v-icon>
                add
              </v-btn>
            </v-card-title>
            <v-divider />
            <v-card-text class='py-2 px-0'>
              <v-layout row 
                style='overflow-x: auto;scroll-direction: horizontal; scroll-behavior: smooth;'  class='px-5'>
                <div v-for='(section,secindex) in sectionNode.sections' :key='secindex' class="py-2 px-1">
                  <SectionNode :class='(secindex+1)==sectionNode.sections.length ? "pr-5" : ""' 
                    @handleRemoveSection='handleRemoveSection' @handleRemove='handleRemoveNode' 
                    @handleSectionMenu='handleSectionMenu' :section='section' :secindex='secindex'/>
                </div>
              </v-layout>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-card-text>
    <v-divider />
    <v-card-actions style='max-height: 50px;'>
      <v-spacer></v-spacer>
      <v-btn @click='saveForm' color='success'>
        save
      </v-btn>
      <v-btn @click='handleAddSection' color='error'>
        discard
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
      ]
    }
  }),
  methods: {
    log(e){
      e.target.focus()
    },
    saveForm(){
      this.$emit("saveForm", this.sectionNode.sections)
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
        {label: "A label", summary: "summary", placeholder: "......", required: false}
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
/*
::-webkit-scrollbar {
  width: 4px;
  height: 4px;
  }
  */
/* Track 
::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  -webkit-border-radius: 4px;
  border-radius: 4px;
}
 */

/* Handle 
::-webkit-scrollbar-thumb {
  -webkit-border-radius: 4px;
  border-radius: 4px;
  background: rgba(223,173,145,0.8);
  -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,0.5);
}
::-webkit-scrollbar-thumb:window-inactive {
  background: rgba(223,173,145,0.4);
}
 */
.up-arrow {
  border-color: #f5ff8d transparent;
  border-style: solid;
  border-width: 0px 7px 7px 7px;
  margin-left: 187px;
  height: 0px;
  width: 0px;
}
</style>
