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
                  <div 
                    v-for='(section,secindex) in sectionNode.sections' :key='secindex' 
                    class="py-2 px-1">
                  <v-card 
                    class='ma-0' 
                    :id='section.name.split(" ")[0].concat(secindex)'
                    style='border-radius: 8px;' min-height='270' width='320' flat tile color='accent darken-1'>
                    <v-card-title d-flex>
                      <v-flex xs10>
                        <v-text-field v-if='editMode' hint='Name of the section' v-model='section.name' box name='' label='Name'>
                        </v-text-field>
                        <strong v-else style='font-size: 18px;'>
                          {{ section.name }}
                        </strong>
                      </v-flex>
                      <v-spacer></v-spacer>
                      <v-flex xs1>
                        <v-menu transition='slide-y-reverse-transition' :nudge-left='180' width='219' offset-y offset-overflow attach>
                          <v-btn slot='activator' flat icon color='black' small>
                            <v-icon color='white' small>
                              more_vert
                            </v-icon>
                          </v-btn>
                          <div>
                            <div class='up-arrow'></div>
                            <v-card flat style='border-radius: 8px;background-color: #f5ff8d;'>
                              <v-list style='background-color: #f5ff8d;'>
                                <v-list-tile 
                                  style='background-color: #f5ff8d;'
                                  v-for="(item, i) in sectionMenu"
                                  :key="i"
                                  @click="(e)=>{ handleSectionMenu(item.actionSwitch, secindex); }">
                                  <v-list-tile-avatar> <v-icon small>{{ item.icon }}</v-icon></v-list-tile-avatar>
                                  <v-list-tile-content>
                                    <v-list-tile-title>
                                      {{ item.title }}
                                    </v-list-tile-title>
                                    <v-list-tile-sub-title>{{ item.sub }}</v-list-tile-sub-title>
                                  </v-list-tile-content>
                                </v-list-tile>
                              </v-list>
                            </v-card>
                          </div>
                        </v-menu>
                      </v-flex>
                    </v-card-title>
                    <v-divider />
                    <v-card-text style='max-height: 280px; overflow-y: auto;'> 
                      <v-layout row wrap> 
                        <v-flex pa-1 v-for='(node,index) in section.nodes' :key='index' xs12 sm md>
                          <FormNode v-on:delete='handleRemoveNode' 
                            :node='node' :index='index' :secname='section.name' :secindex='secindex'/>
                        </v-flex>
                      </v-layout>
                    </v-card-text>
                    <v-divider />
                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn @click='() => { handleRemoveSection(secindex); }' small round color='red'>delete</v-btn>
                    </v-card-actions>
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
    editMode: false,
    sectionMenu: [
      {title: "Add Node",       icon: "add",    actionSwitch: "add", sub: "Add a new entry"},
      {title: "Edit Section",   icon: "edit",   actionSwitch: "edit", sub: "Edits section information"},
      {title: "Remove ", icon: "delete", actionSwitch: "delete", sub: "Deletes this section" },
    ],
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
          this.handleAddSection(index)
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
    editSection(index){
      console.dir(index)
      this.editMode = !this.editMode
    },
    handleAddSection(sectionIndex){
      return this.sectionNode.sections[sectionIndex].nodes.splice(sectionIndex, 0, 
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
