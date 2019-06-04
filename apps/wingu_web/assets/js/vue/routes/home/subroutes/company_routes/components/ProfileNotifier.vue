<template>
  <v-card @click='$router.push(model.path)' style='user-select:none;border-radius: 8px;' class='pt-3 elevation-0'
    height='200' flat color='transparent'>
    <v-layout v-ripple fill-height column style='border: 0.5px solid #996fd6;'>
      <v-flex style='height: 290px;' d-flex align-center justify-content-center>
        <span  
          data-aos-offset='-200' data-aos='zoom-in' :data-aos-delay='i*100' 
          class='text-xs-center'>
          <v-badge color='secondary lighten-2' right >
            <template v-slot:badge>
              <span data-aos='zoom-in' :data-aos-delay='i*120' class='black--text' >6</span>
            </template>
            <!--<v-btn icon large outline>-->
              <v-icon style='transform: scale(1.5);' color='primary darken-1' x-large>
                {{  model.icon }}
              </v-icon>
            <!--</v-btn>-->
          </v-badge>
        </span>
      </v-flex>
      <!--<v-flex style='height:10px;'>-->
        <!--<v-divider />-->
      <!--</v-flex>-->
      <v-flex xs12>
        <v-layout column>
          <v-flex d-flex>
            <span class='text-xs-center' style='font-size: 24px;'>
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
