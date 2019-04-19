<template>
  <v-card data-aos='fade-left' class='ma-0' :id='section.name.split(" ")[0].concat(secindex)' 
    style='border-radius: 8px;' min-height='270' width='320' flat tile color='accent darken-1'>
    <v-card-title d-flex>
      <strong style='font-size: 18px;'>
        {{ section.name }}
      </strong>
      <v-spacer></v-spacer>
      <v-menu attach transition='slide-y-reverse-transition' :nudge-left='180' width='219' offset-y offset-overflow>
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
</template>
<script charset="utf-8">
import FormNode from './FormNode.vue';
export default {
  name: "SectionNode",
  components: { FormNode },
  props: ['section', 'secindex'],
  methods: {
    handleRemoveNode(nodeData){
      this.$emit('handleRemove', nodeData)
    },
    handleSectionMenu(actionSwitch){
      this.$emit('handleSectionMenu', actionSwitch, this.secindex)
    }
  },
  data: () => ({
    sectionMenu: [
      {title: "Add Node",       icon: "add",    actionSwitch: "add", sub: "Add a new entry"},
      {title: "Edit Section",   icon: "edit",   actionSwitch: "edit", sub: "Edits section information"},
      {title: "Remove ", icon: "delete", actionSwitch: "delete", sub: "Deletes this section" },
    ],
  })
}
</script>
