<template>
  <v-card v-ripple @click='$router.push(model.path)' 
    style='user-select:none;border-radius: 8px;' class='pt-3 elevation-3'
    height='200' flat color=''>
    <v-layout fill-height column>
      <v-flex style='height: 400px;' d-flex align-center justify-content-center>
        <span  
          data-aos='zoom-in' :data-aos-delay='i*70' 
          class='text-xs-center'>
          <v-badge color='secondary lighten-2' right >
            <template v-slot:badge>
              <span data-aos='zoom-in' :data-aos-delay='i*90' class='black--text' >6</span>
            </template>
            <!--<v-btn icon large outline>-->
              <v-icon style='transform: scale(1.5);' color='primary' x-large>
                {{  model.icon }}
              </v-icon>
            <!--</v-btn>-->
          </v-badge>
        </span>
      </v-flex>
      <v-flex style='height:10px;'>
        <v-divider />
      </v-flex>
      <v-flex xs12 class='decoration'>
        <v-layout column>
          <v-flex d-flex>
            <span class='text-xs-center' style='font-size: 20px;font-family: "Raleway", sans-serif;'>
              <strong>
              {{ model.title }}
              </strong>
            </span>
          </v-flex>
          <v-flex d-flex align-center justify-content-center>
            <v-card color='transparent' max-width='200' style='margin-left: auto; margin-right: auto;' flat tile>
              <v-card-text class=' pa-0 text-xs-center' style='font-size: 12px;'>
                {{ model.description }}
              </v-card-text>
            </v-card>
          </v-flex>
        </v-layout>
      </v-flex>
    </v-layout>
  </v-card>
</template>
<script charset="utf-8">
export default {
  name: "Notifier",
  props: ['i', 'model'],
  data: () => ({
  })
}
</script>
<style type="text/css" media="screen">
.decoration{
}
</style>
