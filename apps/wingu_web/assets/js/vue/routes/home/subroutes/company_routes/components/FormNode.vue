<template> 
  <v-menu allow-overflow offset-x 
    :open-on-hover='false' v-model='menu'  class='flat elevation-0'
    :close-on-click='true' :close-on-content-click='false' :nudge-bottom='2' 
    transition='slide-y-reverse-transition' style='width:100%;'>
    <v-card v-ripple slot='activator' flat light :color='menu ? "secondary lighten-5" : "secondary lighten-3"' 
      style='border-radius: 4px;width:100%;'>
      <v-card-title class='px-1' 
        >
        <div>
          <v-layout class='ml-2' column>
            <v-flex style='font-size: 16px;'>
              {{ node.label }}
            </v-flex>
            <v-divider />
            <v-flex  style='font-size: 12px;'>
              Short summary
            </v-flex>
          </v-layout>
        </div>
        <v-spacer></v-spacer>
        <v-btn flat color='blue' icon small class='ml-1'>
          <v-icon small>
            edit
          </v-icon>
        </v-btn>
        <v-btn @click.stop='emitDelete' flat color='red' icon small class='ml-1'>
          <v-icon small>
            delete
          </v-icon>
        </v-btn>
      </v-card-title>
    </v-card>
    <div style='display: flex; flex-direction: right;'>
      <div class='up-arrow mt-3'/>
      <v-card light color='secondary lighten-5' style='border-radius: 8px;' width='340' flat tile>
        <v-card-title>
          <v-icon class='pa-2'>
            edit
          </v-icon>
          <div>
            <v-layout column>
              <div style='font-size: 20px;font-weight: bold;'>
                Edit entry
              </div>
              <hr/>
              <hr/>
              <span>
              {{ secname | ellipsisze }} || {{ node.label }}
              </span>
            </v-layout>
          </div>
        </v-card-title>
        <v-divider />
        <v-card-text style='max-height: 240px;overflow-y: scroll;'>
          <v-layout column>
            <v-flex>
              <v-text-field max='63' v-model='node.label' box name='' hint='Display text shown' label='Name of field'>
              </v-text-field>
            </v-flex>
            <v-flex>
              <v-text-field max='63' box name='' hint='Summary of  the description' label='Short description'>
              </v-text-field>
            </v-flex>
            <v-flex>
              <v-textarea max='280' box name='' hint='Describe the entry' label='Full description'>
              </v-textarea>
            </v-flex>
          </v-layout>
        </v-card-text>
        <v-divider />
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn flat round small color='error'>
            <v-icon left small>
              delete
            </v-icon>
            discard
          </v-btn>
          <v-btn flat round small color='green'>
            <v-icon left small>
              save
            </v-icon>
            save
          </v-btn>
        </v-card-actions>
      </v-card>
    </div>
  </v-menu>
</template>
<script charset="utf-8">
export default {
  name: "FormNode",
  props: ['node', 'attachId','index', 'secname', 'secindex'],
  data: () => ({
    menu: false,
    expand: false
  }),
  methods: {
    emitDelete(){
      this.$emit('delete', { sec: this.secindex, ind: this.index })
    }
  },
  filters:{
    ellipsisze(word){
      return word.length > 14 ?  word.slice(0, 11).concat('...') : word
    }
  }
}
</script>
<style scoped type="text/css" media="screen">
.up-arrow {
  border-color: white transparent;
  border-style: solid;
  border-width: 7px 7px 7px 7px;
  border-top: 7px solid transparent;
  border-right: 7px solid #f5ff8d;
  border-bottom: 7px solid transparent;
  border-left: 7px solid transparent;
  margin-left: 0px;
  height: 0px;
  width: 0px;
}
.v-menu__content {
  box-shadow: 0 0px 0px 0px rgba(0,0,0,0), 0 0px 0px 0px rgba(0,0,0,0.0), 0 0px 0px 0px rgba(0,0,0,0);
}
</style>
