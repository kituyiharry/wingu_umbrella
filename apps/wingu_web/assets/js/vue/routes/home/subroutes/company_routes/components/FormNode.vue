<template> 
  <v-menu attach offset-y v-model='menu' 
    :close-on-click='true' :close-on-content-click='false' :nudge-bottom='2' 
    transition='slide-y-reverse-transition' style='width:100%;'>
    <v-card slot='activator' flat light color='secondary lighten-3' style='border-radius: 8px;width:100%;'>
      <v-card-title>
        {{ node.label }}
      </v-card-title>
    </v-card>
    <div>
      <div class='up-arrow'/>
      <v-card style='border-radius: 8px;' flat height='180' tile >
      </v-card>
    </div>
  </v-menu>
</template>
<script charset="utf-8">
export default {
  name: "FormNode",
  props: ['node', 'index', 'secname', 'secindex'],
  data: () => ({
    menu: false,
    expand: false
  }),
  methods: {
  }
}
</script>
<style type="text/css" media="screen">
.up-arrow {
  border-color: white transparent;
  border-style: solid;
  border-width: 0px 7px 7px 7px;
  margin-left: 10px;
  height: 0px;
  width: 0px;
}
</style>
