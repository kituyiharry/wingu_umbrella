<template>
  <v-slide-x-transition>
    <v-card v-show='!deleteCtx' flat 
      :color='deleteCtx ? "red lighten-2" : ""' 
      style='border: 2.0px solid #b589f3;border-radius: 4px;'>
      <!--<v-dialog scrollable transition='slide-y-transition' v-model="settings" persistent max-width="600px">-->
        <!--<template v-slot:activator="{ on }">-->
          <!--<v-btn color="primary" dark v-on="on">Open Dialog</v-btn>-->
          <!--</template>-->
        <v-card-title class='py-1'>
          <v-btn 
            @drag='log' @dragend='log' 
            small id='handle'  icon style='font-size: 9px;' 
            class='black--text mr-2' size='20' 
            color='secondary lighten-3'>
            <v-icon small color='primary darken-1'>
              {{ section.icon }}
            </v-icon>
            <!--{{ i }}-->
          </v-btn>
          <strong style="font-size: 16px;"> Node</strong>
          <v-spacer></v-spacer>
          <v-btn light small @click='settings=!settings' icon color='accent'>
            <v-icon color='black lighten-2' small>
              settings
            </v-icon>
          </v-btn>
          <v-btn dark small @click='pop' icon color='red lighten-3'>
            <v-icon small>
              delete
            </v-icon>
          </v-btn>
        </v-card-title>
        <v-divider />
        <v-card-text style='font-size: 12px;' class='px-4'>
          {{ section.data }}
        </v-card-text>
      </v-card>
    </v-slide-x-transition>
  </template>
  <script charset="utf-8">
export default {
  name: "NodeWrapper",
  props: [ 'id', 'index', 'section', 'drag', 'dragIndex'],
  data: () => ({
    deleteCtx: false,
    dragCtx: false,
    settings: false,
  }),
  methods: {
    log(e){
      console.dir([e,"BNW"])
    },
    pop(){
      this.deleteCtx=true;
      window.setTimeout(()=>{
        this.deleteCtx=false;
        this.$emit("popItem", this.index)
      },800)
    }
  }
}
</script>
