<template>
  <v-card
    @mouseenter='showCardActions=true' 
    @mouseleave='showCardActions=false' 
    @click='$router.push("/forms/".concat(docclass.id))'
    style='
    '
    hover
    :class='$vuetify.breakpoint.smAndDown? "mr-1 my-1 white--text" : "my-1 white--text"' 
    height='160' :width='$vuetify.breakpoint.xsOnly ? 270 : ""'>
    <v-card-title class='pa-2'>
      <v-btn icon flat small color='white'>
        <v-icon small>
          folder_shared
        </v-icon>
      </v-btn>
      <span style="font-size: 16px;">
        <strong>
          {{ docclass.classname }}
        </strong>
      </span>
    </v-card-title>
    <v-divider color='white'/>
    <v-card-text style='font-size: 12px;'>
      {{ docclass.classDescription }}
    </v-card-text>
    <v-slide-y-reverse-transition hide-on-leave>
      <v-card-actions class='white--text' v-show='showCardActions'>
        <v-spacer></v-spacer>
        <v-btn outline icon round small>
          <!--<div v-if='showCardActions' data-aos='zoom-in' data-aos-delay='50'>-->
            <v-icon color='white' small>
              open_in_new
            </v-icon>
          <!--</div>-->
        </v-btn>
        <v-btn icon @click.stop="()=>({})" small color='red lighten-1'>
          <v-icon small>
            delete
          </v-icon>
        </v-btn>
      </v-card-actions>
    </v-slide-y-reverse-transition>
  </v-card>
</template>
<script charset="utf-8">
export default{
  name: "DocCard",
  props: ['docclass'],
  data: () => ({
    showCardActions: false
  })
}
</script>
<style scoped type="text/css" media="screen">
.v-card--hover{
  border-radius: 8px;
  background-image: linear-gradient(to bottom, #AA076BFF, #61045F00);
  background-color: #61045fff;
}
.v-card--hover:hover{
  background-color: #aa076bff;
}
</style>
