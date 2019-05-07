<template>
  <v-container 
    fluid :class='$vuetify.breakpoint.smAndDown ? 
    "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-card :style='$vuetify.breakpoint.mdAndUp ? 
      "border-radius: 4px; background: linear-gradient(to bottom, indigo, #A229D2)" : 
      "background: linear-gradient(to bottom, indigo, white )"' 
      class="white--text" flat>
      <v-card-title>
        <span style='font-size: 32px;width:100%;font-weight: bold;'>Records</span><br/>
        <span>Your data available here</span>
      </v-card-title>
      <v-card-actions class='px-3'>
        <v-spacer></v-spacer>
        <v-menu :close-on-content-click='false' slide-y-transition offset-y attach>
          <div>
            <div class="up-arrow" style='margin-left: 30px;'>
            </div>
            <v-card class='elevation-5' style='border-radius: 8px;'>
              <v-card-title>
                <strong style='font-size:16px;' class='px-3'>Collections</strong>
              </v-card-title>
              <v-divider />
              <v-card-text style='height:200px;overflow-y: auto;'>
              </v-card-text>
            </v-card>
          </div>
          <v-card slot='activator' class='elevation-3' style='border-radius: 8px;'>
            <v-list two-line dense subheader>
              <v-subheader>
                Select a document
              </v-subheader>
              <v-divider />
              <v-list-tile
                avatar ripple
                @click=""
                >
                <v-list-tile-avatar>
                  <v-avatar size='32'>
                    <v-icon>settings</v-icon>
                  </v-avatar>
                </v-list-tile-avatar>

                <v-list-tile-content>
                  <v-list-tile-title>Medical Records</v-list-tile-title>
                  <v-list-tile-sub-title>A Wordy insert Description here</v-list-tile-sub-title>
                </v-list-tile-content>

                <!--<v-list-tile-action>-->
                  <!--<v-btn icon ripple>-->
                    <!--<v-icon color="grey lighten-1">info</v-icon>-->
                    <!--</v-btn>-->
                  <!--</v-list-tile-action>-->
              </v-list-tile>

            </v-list>
          </v-card>
        </v-menu>
      </v-card-actions>
      <v-divider />
      <v-card-text class='px-2'>
        <v-layout row wrap>
          <v-flex xs12 sm6 md5 pa-1>
            <v-card style='border-radius: 8px;' class='elevation-8'>
              <v-card-text>
                <v-layout row wrap>
                  <v-flex xs12 sm6 lg5>
                    <v-card flat tile>
                      <v-card-title class='px-0'>
                        <v-layout row wrap>
                          <v-flex xs3>
                            <v-avatar >
                              <v-icon large>
                                collections_bookmark
                              </v-icon>
                            </v-avatar>
                          </v-flex>
                          <v-flex xs9>
                            <v-layout column>
                              <v-flex>
                                <span class='' style='font-size: 18px;'>
                                  Collection Title
                                </span>
                              </v-flex>
                              <v-flex>
                                <span class='grey--text'>Summary</span>
                              </v-flex>
                            </v-layout>
                          </v-flex>
                        </v-layout>
                      </v-card-title>
                      <v-divider />
                      <v-card-text class='pa-0'>
                        <v-list two-line subheader>
                          <!--<v-subheader inset>Folders</v-subheader>-->
                          <v-list-tile
                            v-for="(item,ind) in ['Date', 'Time']"
                            :key="ind"
                            avatar
                            @click="">
                            <v-list-tile-avatar>
                              <v-icon small>date_range</v-icon>
                            </v-list-tile-avatar>
                            <v-list-tile-content>
                              <v-list-tile-title>{{ item }}</v-list-tile-title>
                              <v-list-tile-sub-title>{{ item }}</v-list-tile-sub-title>
                            </v-list-tile-content>
                          </v-list-tile>
                        </v-list>
                      </v-card-text>
                    </v-card>
                  </v-flex>
                  <!--<v-divider vertical/>-->
                  <v-flex xs12 sm6 lg7>
                    <v-card flat tile>
                      <v-card-text class='text-xs-justify'>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                      </v-card-text>
                    </v-card>
                  </v-flex>
                </v-layout>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn icon :key='i' v-for='(it,i) in ["delete", "edit", "share"]'>
                  <v-icon >
                    {{ it }}
                  </v-icon>
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-flex>
          <v-flex xs12 sm6 md7 pa-1>
            <v-card style='border-radius: 8px;' class='elevation-8'>
              <v-card-title>
                <span style="font-size: 24px;">
                  Nutrition
                </span>
                <v-spacer></v-spacer>
                <v-text-field
                  v-model="search"
                  append-icon="search"
                  label="Search"
                  single-line
                  hide-details
                  ></v-text-field>
              </v-card-title>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-select
                  :items="$store.state.store.documentClasses"
                  label="Outline style" chips
                  v-model='docclass'
                  item-text='classname'
                  return-object
                  outline
                  ></v-select>
              </v-card-actions>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn round small flat>
                  <v-icon left small>
                    date_range
                  </v-icon>
                  BY DATE
                </v-btn>
                <v-btn round small flat>
                  <v-icon left small>
                    sort_by_alpha
                  </v-icon>
                  BY NAME
                </v-btn>
              </v-card-actions>
              <v-divider />
              <v-divider />
              <v-card-text>
                <v-layout class='pt-3' row style='min-height:200px;;overflow-x: scroll;'>
                  <v-flex xs12 px-1 v-for='i in 16' :key='i'>
                    <v-card color='primary' hover flat tile height='150' width='230'>
                    </v-card>
                  </v-flex>
                </v-layout>
              </v-card-text>
              <v-divider />
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn flat round>
                  hide
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-flex>
          <v-flex xs12 sm4 md3 pa-1>
            <v-card height='300' style='border-radius: 8px;' class='elevation-8'>
            </v-card>
          </v-flex>
          <v-flex xs12 sm8 md9>
            <v-layout row wrap>
              <v-flex xs12 sm5 pa-1>
                <v-card height='300' style='border-radius: 8px;' class='elevation-8'>
                </v-card>
              </v-flex>
              <v-flex xs12 sm7 pa-1>
                <v-card height='300' style='border-radius: 8px;' class='elevation-8'>
                </v-card>
              </v-flex>
            </v-layout>
          </v-flex>
        </v-layout>
      </v-card-text>
    </v-card>
  </v-container>
</template>
<script charset="utf-8">
export default {
  name: "Records",
  data: () => ({
    drawerItems: [
      { title: 'Home', icon: 'dashboard' },
      { title: 'About', icon: 'question_answer' },
      { title: 'Home', icon: 'dashboard' },
      { title: 'About', icon: 'question_answer' },
      { title: 'Home', icon: 'dashboard' },
      { title: 'About', icon: 'question_answer' },
    ],
    right: null,
    docclass: null,
    item: [
      "Group 1",
      "Group 2"
    ],
    docGroup: null,
    headers: [
      {
        text: 'Dessert (100g serving)',
        align: 'left',
        sortable: false,
        value: 'name'
      },
      { text: 'Calories', value: 'calories' },
      { text: 'Fat (g)', value: 'fat' },
      { text: 'Carbs (g)', value: 'carbs' },
      { text: 'Protein (g)', value: 'protein' },
      { text: 'Iron (%)', value: 'iron' }
    ],
    desserts: [
      {
        name: 'Frozen Yogurt',
        calories: 159,
        fat: 6.0,
        carbs: 24,
        protein: 4.0,
        iron: '1%'
      },
      {
        name: 'Ice cream sandwich',
        calories: 237,
        fat: 9.0,
        carbs: 37,
        protein: 4.3,
        iron: '1%'
      },
      {
        name: 'Eclair',
        calories: 262,
        fat: 16.0,
        carbs: 23,
        protein: 6.0,
        iron: '7%'
      },
      {
        name: 'Cupcake',
        calories: 305,
        fat: 3.7,
        carbs: 67,
        protein: 4.3,
        iron: '8%'
      },
      {
        name: 'Gingerbread',
        calories: 356,
        fat: 16.0,
        carbs: 49,
        protein: 3.9,
        iron: '16%'
      },
      {
        name: 'Jelly bean',
        calories: 375,
        fat: 0.0,
        carbs: 94,
        protein: 0.0,
        iron: '0%'
      },
      {
        name: 'Lollipop',
        calories: 392,
        fat: 0.2,
        carbs: 98,
        protein: 0,
        iron: '2%'
      },
      {
        name: 'Honeycomb',
        calories: 408,
        fat: 3.2,
        carbs: 87,
        protein: 6.5,
        iron: '45%'
      },
      {
        name: 'Donut',
        calories: 452,
        fat: 25.0,
        carbs: 51,
        protein: 4.9,
        iron: '22%'
      },
      {
        name: 'KitKat',
        calories: 518,
        fat: 26.0,
        carbs: 65,
        protein: 7,
        iron: '6%'
      }
    ],
  })
}
</script>
