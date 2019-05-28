<template>
  <v-card :height='$vuetify.breakpoint.mdAndUp ? "518" : ""' :style='$vuetify.breakpoint.xsOnly ? "": "border-radius: 8px;"' flat tile>
    <v-card-title class='elevation-2 pa-2 primary white--text'>
      <!--<v-toolbar dark color='primary' flat height='86'>-->
        <v-avatar data-aos='zoom-in' data-aos-once='false' data-aos-delay='200' size='64'>
          <img src="https://avataaars.io/?avatarStyle=Circle&topType=ShortHairFrizzle&accessoriesType=Prescription02&hairColor=Black&facialHairType=MoustacheMagnum&facialHairColor=BrownDark&clotheType=BlazerSweater&clotheColor=Black&eyeType=Default&eyebrowType=FlatNatural&mouthType=Default&skinColor=Tanned" alt=''>
        </v-avatar>
        <!--<v-toolbar-title>-->
          <v-layout class='ml-2' column>
            <div style='font-size: 18px;text-overflow: scroll;'>
              <strong>Thanos Guy</strong>
            </div>
            <span style='font-size: 12px;'>F, 22yrs</span>
          </v-layout>
          <!--</v-toolbar-title>-->
        <v-spacer></v-spacer>
        <v-btn icon>
          <v-icon color='white'>
            contacts
          </v-icon>
        </v-btn>
        <!--</v-toolbar>-->
    </v-card-title>
    <v-divider />
    <v-card-text class='pa-0'>
      <v-layout row wrap>
        <v-flex 
          class='white--text'
          :style='$vuetify.breakpoint.lgAndUp ? "min-height: 250px; overflow-y: auto;" : ""'
          xs12 md5 lg5 px-0>
          <v-tabs
            v-model="active"
            color="primary"
            dark centered 
            slider-color="yellow"
            >
            <v-tab
              v-for="(i,n) in ['Foundation', 'Custom', 'Payment']"
              :key="n"
              :ripple='false'
              >
              <v-btn dark
                :class='(active==(n)) ? "secondary lighten-3 black--text" : "white--text"'  
                small round :flat="(active!==(n))">
                {{ i }}
              </v-btn>
            </v-tab>
          </v-tabs>
          <v-tabs-items touchless v-model='active'>
            <v-tab-item
              v-for="n in 3"
              :key="n"
              >
              <v-card color='primary lighten-2' :height='$vuetify.breakpoint.mdAndUp ? "340" : "150"' 
                style='overflow-y: auto;' flat class='white--text'>
                <v-card-text>
                  <draggable tag='v-layout'  
                    :componentData='getComponentData()' v-model='tags'
                    :clone="createNode"
                    :group='{name: "nodes", pull: "clone", put: false}' 
                    handle='#handle' row wrap>
                    <!--<v-layout row :wrap='$vuetify.breakpoint.mdAndUp'>-->
                      <!--<v-flex xs12>-->
                        <v-flex py-1 :px-4='$vuetify.breakpoint.mdAndUp' :px-2='$vuetify.breakpoint.smAndDown'
                          v-for='(n,i) in tags' :key='i' xs12>
                          <v-card id='dragthis' height='80' 
                            :width='$vuetify.breakpoint.mdAndUp ? "" : "200"' 
                            style='border: 1px solid #C049F3;'>
                            <v-card-title>
                              <!--<v-btn small icon flat>-->
                                <v-icon id='handle' small>
                                  reorder
                                </v-icon>
                                <!--</v-btn>-->
                              <v-layout row wrap>
                                <v-flex xs5>
                                  <v-btn icon flat>
                                    <v-icon>
                                      {{ n.action }}
                                    </v-icon>
                                  </v-btn>
                                </v-flex>
                                <v-flex xs7  style='font-size: 20px;' d-flex align-center justify-content-center class='text-xs-center'>
                                  {{ n.label }}
                                </v-flex>
                              </v-layout>
                            </v-card-title>
                          </v-card>
                        </v-flex>
                      <!--</v-layout>-->
                    </draggable>
                  </v-card-text>
                </v-card>
              </v-tab-item>
            </v-tabs-items>
          </v-flex>
          <v-flex xs12 md7 lg7>
            <!--<v-divider v-if='$vuetify.breakpoint.smAndDown'/>-->
            <v-tabs
              v-model="currentItem"
              color="primary lighten-1" centered show-arrows
              hide-slider
              slider-color="yellow"
              >
              <!--<v-tabs-slider color="yellow"></v-tabs-slider>-->
              <v-tab :ripple='false'
                v-for="(item,ind) in sectionNode.sections"
                :key="ind"
                >
                <!--:href="'#tab-' + item"-->
                <v-btn small 
                  :class='(currentItem==ind) ? "secondary lighten-3 black--text" : "white--text"'
                  round :flat='!(currentItem==ind)'>
                  {{ item.name }}
                </v-btn>
              </v-tab>
            </v-tabs>

            <v-tabs-items v-model="currentItem">
              <v-tab-item
                v-for="(item,ind) in sectionNode.sections"
                :key="ind"
                >
                <!--:value="sectionNode.sections[0]"-->
                <v-card flat>
                  <v-divider />
                  <!--<v-card-title style='height: 56px;z-index: 2;' class='primary lighten-1 white--text'>-->
                    <!--<v-icon small dark class='pa-2'>-->
                      <!--drag_handle-->
                      <!--</v-icon>-->
                    <!--<h2 class='pl-1'>{{ item }}</h2>-->
                    <!--</v-card-title>-->
                  <!--<v-divider />-->
                  <v-card-text class='text-xs-justify here' 
                    :style='$vuetify.breakpoint.mdAndUp ? "max-height: 342px; overflow-y: scroll;" : ""'>
                    <v-layout fill-height row wrap style='height:100%;'>
                      <draggable group='nodes' style='width: 100%;'
                        v-bind="dragOptions" @change='log' 
                        @start="prepareDrag" @end="closeDrag" 
                        v-model='sectionNode.sections[currentItem].nodes' handle='#handle'>
                        <transition-group  
                          type="transition" :name="!drag ? 'flip-list' : null">
                          <v-flex style='width: 100%;' py-2 :px-3='$vuetify.breakpoint.mdOnly'  :px-4='$vuetify.breakpoint.lgAndUp' xs12  
                            v-for='(n,i) in sectionNode.sections[currentItem].nodes' :key='i'>
                            <NodeWrapper  :drag='drag' :dragIndex='dragIndex' :index='i' :section='n'/> 
                          </v-flex>
                        </transition-group>
                        </draggable >
                      </v-layout>
                    </v-card-text>
                  </v-card>
                </v-tab-item>
              </v-tabs-items>
            </v-flex>
          </v-layout>
        </v-card-text>
        <v-divider />
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn depressed dark round color='green lighten-1' @click='handleAddSection' small>
            <v-icon left small>
              add
            </v-icon>
            add
          </v-btn>
          <v-btn depressed dark round color='red lighten-2' @click='$emit("closeDialog")' small>
            <v-icon left small>
              close
            </v-icon>
            exit
          </v-btn>
        </v-card-actions>
      </v-card>
    </template>
    <script charset="utf-8">
import draggable from 'vuedraggable'
import NodeWrapper from './nodes/NodeWrapper.vue';
export default {
  name: "FormWizard",
  components: { draggable, NodeWrapper },
  data: () => ({
    editMode: false,
    active: 1,
    currentItem: 0,
    items: ["identity", "location"],
    drag: false,
    dragIndex: null,
    tags: [
      {label: "Text",   description:"", action: "text_fields"},
      {label: "Number", description:"", action: "dialpad"},
    ],
    sectionNode: {
      sections: [
        {
          name: "Identity", nodes: [
            {icon: "date_range", data: "Mon Dec 2018"},
            {icon: "dialpad", data: "Use the footer slot to add none-draggable element inside the vuedraggable"},
            {icon: "keyboard", data: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invi Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."},
            {icon: "date_range", data: "Mon Dec 2018"},
          ]
        },
        {
          name: "Information", nodes: [
            {icon: "date_range", data: "Mon Dec 2018"},
          ]
        }
      ]
    }
  }),
  methods: {
    prepareDrag(i){
      console.dir(i)
      this.dragIndex=i.oldIndex
      this.drag=true
    },
    closeDrag(i){
      this.dragIndex=i.newIndex
      window.setTimeout(()=>{
        this.dragIndex=null
      }, 500)
      this.drag=false
    },
    log(e){
      console.dir(e)
    },
    sort() {
      this.list = this.list.sort((a, b) => a.order - b.order);
    },
    saveForm(){
      this.$emit("saveForm", this.sectionNode.sections)
    },
    createNode(e){
      console.dir(e)
      switch(e.action){
        case "text_fields":
          return {icon: "keyboard", data: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invi Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."};
          break;
        default: 
            return {icon: "date_range", data: "Mon Dec 2018"}
            break;
      }
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
    },
    getComponentData() {
      return {
        on: {
          //change: this.handleChange,
          //input: this.inputChanged
        },
        attrs:{
          row: true,
          wrap: this.$vuetify.breakpoint.mdAndUp
        },
        props: {
          //value: this.activeNames
        }
      };
    }
  },
  computed: {
    dragOptions() {
      return {
        animation: 200,
        //group: "description",
        disabled: false,
        //ghostClass: "ghost"
      };
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

handle{
  cursor: grab;
}

.flip-list-move {
  transition: transform 0.5s;
}
.no-move {
  transition: transform 0s;
}
</style>
