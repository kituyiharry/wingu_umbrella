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
          <div>
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
                <v-divider />
                <v-card color='primary' :height='$vuetify.breakpoint.mdAndUp ? "340" : "150"' 
                  style='overflow-y: auto;' flat class='white--text'>
                  <v-card-text>
                    <draggable tag='v-layout'  
                          :move='move' 
                      :componentData='getComponentData()' v-model='tags'
                      :clone="createNode" @start='prepareDrag' @end='closeDrag'
                      :group='{name: "nodes", pull: "clone", put: false}' 
                      handle='#handle' row wrap>
                      <!--<v-layout row :wrap='$vuetify.breakpoint.mdAndUp'>-->
                        <!--<v-flex xs12>-->
                          <!--:px-2='$vuetify.breakpoint.mdAndUp' :px-2='$vuetify.breakpoint.xsOnly'-->
                          <v-flex py-1 :px-1='$vuetify.breakpoint.smAndDown' :px-3='$vuetify.breakpoint.mdAndUp' xs12
                            v-for='(n,i) in tags' :key='i'>
                            <v-card id='dragthis' height='110'
                              :minWidth='$vuetify.breakpoint.mdAndUp ? "" : "200"' 
                              style='border-radius:4px;border: 1.0px solid #C049F3;'>
                              <v-card-title id='handle' class='py-2'>
                                <!--<v-btn small icon flat>-->
                                  <v-icon small>
                                    reorder
                                  </v-icon>
                                </v-card-title>
                                <v-divider />
                                <!--</v-btn>-->
                              <v-layout row wrap>
                                <v-flex xs2 d-flex align-center>
                                  <v-btn small icon flat>
                                    <v-icon small>
                                      {{ n.action }}
                                    </v-icon>
                                  </v-btn>
                                </v-flex>
                                <v-flex px-1 xs10>
                                  <v-layout column>
                                    <v-flex py-1 style='font-size: 14px;'>
                                      <strong>
                                        {{ n.label }}
                                      </strong>
                                    </v-flex>
                                    <v-flex style='font-size: 12px;'>
                                      Lorem ipsum dolor sit amet
                                    </v-flex>
                                  </v-layout>
                                </v-flex>
                              </v-layout>
                            </v-card>
                          </v-flex>
                          <!--</v-layout>-->
                      </draggable>
                    </v-card-text>
                  </v-card>
                </v-tab-item>
              </v-tabs-items>
            </div>
          </v-flex>
          <v-flex xs12 md7 lg7>
            <v-divider v-if='$vuetify.breakpoint.smAndDown'/>
            <div>
              <v-tabs
                v-model="currentItem"
                color="primary" centered lazy show-arrows
                hide-slider
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

              <v-tabs-items touchless v-model="currentItem">
                <v-tab-item
                  v-for="(item,ind) in sectionNode.sections"
                  :key="ind"
                  >
                  <!--:value="sectionNode.sections[0]"-->
                  <v-card flat :min-height='$vuetify.breakpoint.mdAndUp ? "342" : "auto"'>
                    <v-divider />
                    <!--<v-card-title style='height: 56px;z-index: 2;' class='primary lighten-1 white--text'>-->
                      <!--<v-icon small dark class='pa-2'>-->
                        <!--drag_handle-->
                        <!--</v-icon>-->
                      <!--<h2 class='pl-1'>{{ item }}</h2>-->
                      <!--</v-card-title>-->
                    <!--<v-divider />-->
                    <v-card-text :class='drag ? "text-xs-justify here secondary lighten-3" : "text-xs-justify here"' 
                      :style='$vuetify.breakpoint.mdAndUp ? "height: 342px; overflow-y: scroll;" : "height:auto;"'>
                      <v-layout fill-height row wrap>
                        <draggable group='nodes' style='width: 100%;'
                          v-bind="dragOptions" 
                          @start="prepareDrag" @end="closeDrag" :remove='log' 
                          v-model='sectionNode.sections[currentItem].nodes' handle='#handle'>
                          <!--<div style="min-height:100px;">-->
                            <transition-group
                              type="transition" :name="!drag ? 'flip-list' : ''">
                              <NodeWrapper 
                                v-for='(n,i) in sectionNode.sections[currentItem].nodes' :key='n.key'
                                :id='`node-${i+n.icon}`'
                                :ref='`node-${i+n.icon}`'
                                @transitionEnd='log' @popItem='handleRemoveNode' 
                                :drag='drag' :dragIndex='dragIndex' :index='i' :section='n'/> 
                              <v-flex
                                key='emptySlot'
                                xs12>
                                <v-slide-y-reverse-transition>
                                  <v-card 
                                    v-show='sectionNode.sections[currentItem].nodes<1 && !moveCtx' 
                                    flat style='border: 1.2px solid #b589f3;border-radius: 4px;'>
                                    <v-card-text>
                                      No Data available! Drag an item using <v-icon small>drag_handle</v-icon> from panels available to add and configure them here.
                                    </v-card-text>
                                  </v-card>
                                </v-slide-y-reverse-transition>
                              </v-flex>
                            </transition-group>
                            <!--</div>-->
                          </draggable >
                        </v-layout>
                      </v-card-text>
                    </v-card>
                  </v-tab-item>
                </v-tabs-items>
              </div>
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
    moveCtx: false,
    items: ["identity", "location"],
    drag: false,
    dragIndex: null,
    tags: [
      {label: "Text",   description:"", action: "text_fields"},
      {label: "Number", description:"", action: "dialpad"},
      {label: "Text",   description:"", action: "text_fields"},
      {label: "Number", description:"", action: "dialpad"},
      {label: "Text",   description:"", action: "text_fields"},
      {label: "Number", description:"", action: "dialpad"},
      {label: "Text",   description:"", action: "text_fields"},
      {label: "Number", description:"", action: "dialpad"},
    ],
    sectionNode: {
      sections: [
        {
          name: "Identity", nodes: [
          ]
        },
        {
          name: "Information", nodes: [
          ]
        }
      ]
    }
  }),
  methods: {
    uniq(){
      return '_' + Math.random().toString(36).substr(2, 9);
    },
    prepareDrag(){
      //this.dragIndex=i.oldIndex
      this.drag=true
    },
    closeDrag(i){
      //console.dir(i)
      //this.dragIndex=i.newIndex
      //window.setTimeout(()=>{
      //  this.dragIndex=null
      //}, 500)
      this.drag=false
      this.moveCtx = false
    },
    move(e){
      this.moveCtx = true
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
      //console.dir(e)
      let uKey= this.uniq()
      switch(e.action){
        case "text_fields":
          return {icon: "keyboard", key: uKey, data: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invi Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", show: true};
        default: 
          return {icon: "date_range", key: uKey, data: "Mon Dec 2018", show: true}
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
    handleRemoveNode(node){
      //return this.sectionNode.sections[this.currentItem].nodes[node].show=false
      return this.sectionNode.sections[this.currentItem].nodes.splice(node, 1)
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

#handle{
  cursor: grab;
}

.flip-list-move {
  transition: transform 0.5s;
}
.no-move {
  transition: transform 0s;
}
</style>
