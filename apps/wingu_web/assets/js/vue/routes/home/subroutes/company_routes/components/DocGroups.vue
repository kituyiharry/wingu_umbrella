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
          class='pl-4 primary white--text'
          style='max-height: 385px; overflow-y: auto;'
          xs12 md6 lg5 px-0>
            <!--:style=' $vuetify.breakpoint.mdAndUp ? "margin-left: 40px;" : "margin-left: 28px;"'-->
          <v-timeline 
            align-top 
            dense>
            <v-timeline-item
              color="pink"
              small
              >
              <v-layout pt-3>
                <v-flex xs3>
                  <strong>5pm</strong>
                </v-flex>
                <v-flex>
                  <strong>New Icon</strong>
                  <div class="caption">Mobile App</div>
                </v-flex>
              </v-layout>
            </v-timeline-item>

            <v-timeline-item
              color="teal lighten-3"
              small
              >
              <v-layout wrap pt-3>
                <v-flex xs3>
                  <strong>3-4pm</strong>
                </v-flex>
                <v-flex>
                  <strong>Design Stand Up</strong>
                  <div class="caption mb-2">Hangouts</div>
                  <v-avatar>
                    <v-img
                      src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairFrida&accessoriesType=Kurt&hairColor=Red&facialHairType=BeardLight&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=Wink&eyebrowType=RaisedExcitedNatural&mouthType=Disbelief&skinColor=Brown"
                      ></v-img>
                  </v-avatar>
                  <v-avatar>

                    <v-img
                      src="https://avataaars.io/?avatarStyle=Circle&topType=ShortHairFrizzle&accessoriesType=Prescription02&hairColor=Black&facialHairType=MoustacheMagnum&facialHairColor=BrownDark&clotheType=BlazerSweater&clotheColor=Black&eyeType=Default&eyebrowType=FlatNatural&mouthType=Default&skinColor=Tanned"
                      ></v-img>
                  </v-avatar>
                  <v-avatar>
                    <v-img
                      src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairMiaWallace&accessoriesType=Sunglasses&hairColor=BlondeGolden&facialHairType=Blank&clotheType=BlazerSweater&eyeType=Surprised&eyebrowType=RaisedExcited&mouthType=Smile&skinColor=Pale"
                      ></v-img>
                  </v-avatar>
                </v-flex>
              </v-layout>
            </v-timeline-item>

            <v-timeline-item
              color="pink"
              small
              >
              <v-layout pt-3>
                <v-flex xs3>
                  <strong>12pm</strong>
                </v-flex>
                <v-flex>
                  <strong>Lunch break</strong>
                </v-flex>
              </v-layout>
            </v-timeline-item>

            <v-timeline-item
              color="pink"
              small
              >
              <v-layout pt-3>
                <v-flex xs3>
                  <strong>12pm</strong>
                </v-flex>
                <v-flex>
                  <strong>Lunch break</strong>
                </v-flex>
              </v-layout>
            </v-timeline-item>

            <v-timeline-item
              color="pink"
              small
              >
              <v-layout pt-3>
                <v-flex xs3>
                  <strong>12pm</strong>
                </v-flex>
                <v-flex>
                  <strong>Lunch break</strong>
                </v-flex>
              </v-layout>
            </v-timeline-item>

            <v-timeline-item
              color="teal lighten-3"
              small
              >
              <v-layout pt-3>
                <v-flex xs3>
                  <strong>9-11am</strong>
                </v-flex>
                <v-flex>
                  <strong>Finish Home Screen</strong>
                  <div class="caption">Web App</div>
                </v-flex>
              </v-layout>
            </v-timeline-item>
          </v-timeline>
        </v-flex>
        <v-flex xs12 md6 lg7>
          <!--<v-divider v-if='$vuetify.breakpoint.smAndDown'/>-->
          <v-tabs
            v-model="currentItem"
            color="primary lighten-1" centered show-arrows
            hide-slider
            slider-color="yellow"
            >
            <!--<v-tabs-slider color="yellow"></v-tabs-slider>-->
            <v-tab :ripple='false'
              v-for="(item,ind) in items"
              :key="ind"
              :href="'#tab-' + item"
              >
              <v-btn small 
                :class='(currentItem=="tab-"+item) ? "secondary lighten-3 black--text" : "white--text"'
                round :flat='!(currentItem=="tab-"+item)'>
                {{ item }}
              </v-btn>
            </v-tab>
          </v-tabs>

          <v-tabs-items v-model="currentItem">
            <v-tab-item
              v-for="(item,ind) in items"
              :key="ind"
              :value="'tab-' + item"
              >
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
                  :style='$vuetify.breakpoint.mdAndUp ? "max-height: 330px; overflow-y: scroll;" : ""'>
                  <v-layout row wrap>
                    <v-flex pa-2 xs12  v-for='i in 9'>
                      <v-card  v-ripple flat 
                        style='border: 2.0px solid #b589f3;border-radius: 4px;'>
                        <v-card-title class='py-1'>
                          <v-btn small icon style='font-size: 9px;' class='black--text mr-2' size='20' 
                            color='secondary lighten-3'>
                            <v-icon small color='primary darken-1'>
                              {{ i%2==0 ? "keyboard" : (i%3==0 ? "dialpad"  : "date_range") }}
                            </v-icon>
                            <!--{{ i }}-->
                          </v-btn>
                          <strong style="font-size: 16px;"> Node {{ i }}</strong>
                        </v-card-title>
                        <v-card-text v-if='i%2==0' class='text-xs-left px-4' style='font-size: 12px;'>
                          Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                          tempor invi
                          Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                          tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
                          vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
                          no sea takimata sanctus est Lorem ipsum dolor sit amet.
                        </v-card-text>
                        <v-card-text v-else-if='i%3==0' class='text-xs-left px-4' style='font-size: 12px;'>
                          Lorem ipsum
                        </v-card-text>
                        <v-card-text v-else style='font-size: 12px;' class='px-4'>
                          {{ $moment("12-03-2018").format("ddd MMM YYYY") }}
                        </v-card-text>
                      </v-card>
                    </v-flex>
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
export default {
  name: "DocGroups",
  props: ['showDocClassForm'],
  data: ()=>({
    currentItem: 'tab-Web',
    items: [
      'Web', 'Shopping', 'Videos', 'Images',
      'News', 'Maps', 'Books', 'Flights', 'Apps'
    ],
    more: [
      'News', 'Maps', 'Books', 'Flights', 'Apps'
    ],
  })
}
</script>
<style type="text/css" media="screen">
.v-tabs__icon {
  display: flex;
  justify-content: center;
  align-items: center;
  align-self: center;
  align-items: center;
}
.here{
  background: linear-gradient(to right, 
  transparent 0%, 
  transparent calc(18% - 1.81px), 
  #b589f3 calc(18% - 1.8px), 
  #b589f3 calc(18% + 1.8px), 
  transparent calc(18% + 1.81px), 
  transparent 100%); 
}
</style>
