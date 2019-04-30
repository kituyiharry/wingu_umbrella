<template>
  <div data-aos='fade-left'>
    <v-slide-x-transition>
      <v-card hover v-show='showSection' 
        class='ma-0 elevation-2' :id='section.name.split(" ")[0].concat(secindex)' 
        style='border-radius: 8px;' min-height='270' width='320' flat tile 
        :color=' editMode ? "primary" : "accent darken-1"'>
        <v-card-title d-flex>
          <div>
            <v-layout column>
              <v-flex>
                <strong style='font-size: 18px;'>
                  {{ section.name }}
                </strong>
              </v-flex>
              <v-flex>
                {{ section.nodes.length }} entries || {{ section.summary }}
              </v-flex>
            </v-layout>
          </div>
          <v-spacer></v-spacer>
          <v-menu attach transition='slide-y-reverse-transition' :nudge-left='230' 
            width='219' offset-y offset-overflow>
            <v-btn slot='activator' flat icon color='black' small>
              <v-icon color='white' small>
                more_vert
              </v-icon>
            </v-btn>
            <div>
              <div class='up-arrow' style='margin-left: 237px;'></div>
              <v-card flat style='border-radius: 8px;background-color: #f5ff8d;'>
                <v-list style='background-color: #f5ff8d;'>
                  <v-list-tile v-ripple
                    style='background-color: #f5ff8d;'
                    v-for="(item, i) in sectionMenu"
                    :key="i"
                    @click="(e)=>{ handleSectionMenuTimeout(item.actionSwitch); }">
                    <v-list-tile-avatar> 
                      <v-icon small>{{ item.icon }}</v-icon>
                    </v-list-tile-avatar>
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
        </v-card-title>
        <v-divider />
        <v-slide-y-transition hide-on-leave> 
          <v-card-text style='max-height: 280px;overflow-y: auto;' v-show='editMode'>
            <v-layout column>
              <v-flex>
                <v-text-field counter='63' color='white' class='white--text' clearable 
                  v-model='section.name' box name='' label='Name' hint='Section name' >
                </v-text-field>
              </v-flex>
              <v-flex>
                <v-text-field counter='63' color='white' clearable v-model='section.summary' box name='' 
                  label='Summary' hint='Short Descriptions' >
                </v-text-field>
              </v-flex>
              <v-flex>
                <v-textarea counter='280' color='white' box description clearable 
                  v-model='section.description' 
                  name='' 
                  label='Description' 
                  hint='Description of this section'>
                </v-textarea>
              </v-flex>
            </v-layout>
          </v-card-text>
        </v-slide-y-transition>
        <v-divider />
        <v-slide-y-reverse-transition hide-on-leave>
        <v-card-text v-show='!editMode' style='max-height: 280px; overflow-y: auto;'> 
          <v-layout row wrap v-if='section.nodes.length>0'> 
            <v-flex data-aos='fade-up' data-aos-offset='-10000000' pa-1 v-for='(node,index) in section.nodes' :key='index' xs12 sm md>
              <FormNode v-on:delete='handleRemoveNode' 
                :node='node' :index='index' :secname='section.name' :secindex='secindex'/>
            </v-flex>
          </v-layout>
          <v-layout v-else>
            <v-card height='100' color='transparent' flat tile>
              <v-card-text class='text-xs-center'>
                No entries available you can <kbd style='background-color:green;' @click='() => { handleSectionMenuTimeout("add"); }'>Add new</kbd> entries
              </v-card-text>
            </v-card>
          </v-layout>
        </v-card-text>
      </v-slide-y-reverse-transition>
      <v-divider />
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn v-show='editMode' @click='editMode=!editMode' small flat round color='success'>
          <strong>
            save
          </strong>
        </v-btn>
        <v-btn v-show='editMode' @click='editMode=!editMode' small round flat color='error'>
          <strong>
            discard
          </strong>
        </v-btn>
        <v-btn v-show='!editMode' @click='editMode=true' small flat round color='secondary'>
          <strong>
            edit
          </strong>
        </v-btn>
        <v-btn v-show='!editMode' @click='handleCreateTimeout' small flat round color='error'>
          <strong>
            delete
          </strong>
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-slide-x-transition>
  <v-snackbar bottom right mb-3 color='error' v-model='showSnack'>
    <span>
      <em>{{ section.name }}</em> section deleted
    </span>
    <v-btn
      color=""
      flat round
      @click="handleCancelTimeout"
      >
      <strong>
        undo
      </strong>
    </v-btn>
  </v-snackbar>
</div>
</template>
<script charset="utf-8">
import FormNode from './FormNode.vue';
export default {
  name: "SectionNode",
  components: { FormNode },
  cancelCallback: null,
  props: ['section', 'secindex'],
  methods: {
    handleRemoveNode(nodeData){
      this.$emit('handleRemove', nodeData)
    },
    handleSectionMenuTimeout(itemSwitch){
      switch (itemSwitch) {
        case 'delete':
          this.cancelCallback = window.setTimeout(() => {
            this.handleSectionMenu(itemSwitch, this.secindex)
          }, 30000)
          this.showSnack = true
          this.showSection= false
          break;
        case 'edit':
          this.editMode = true; 
          break;
        default:
          this.handleSectionMenu(itemSwitch, this.secindex)
          break;
      }
    },
    handleCancelTimeout(){
      window.clearTimeout(this.cancelCallback)
      this.showSnack=false
      this.showSection=true
    },
    handleCreateTimeout(){
      this.cancelCallback = window.setTimeout(() => {
        this.handleRemoveSection()
      }, 30000)
      this.showSnack = true
      this.showSection= false
    },
    handleRemoveSection(){
      this.$emit('handleRemoveSection', this.secindex)
    },
    handleSectionMenu(actionSwitch){
      this.$emit('handleSectionMenu', actionSwitch, this.secindex)
    }
  },
  data: () => ({
    editMode: false,
    showSection: true, 
    showSnack: false,
    sectionMenu: [
      {title: "Add Node",       icon: "add",    actionSwitch: "add", sub: "Add a new entry"},
      {title: "Edit Section",   icon: "edit",   actionSwitch: "edit", sub: "Edits section information"},
      {title: "Remove ", icon: "delete", actionSwitch: "delete", sub: "Deletes this section" },
    ],
  })
}
</script>
