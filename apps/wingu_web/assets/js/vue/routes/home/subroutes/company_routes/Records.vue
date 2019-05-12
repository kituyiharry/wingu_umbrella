<template>
  <v-container 
    fluid :class='$vuetify.breakpoint.smAndDown ? 
    "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-card :style='$vuetify.breakpoint.mdAndUp ? 
      "border-radius: 4px; background: linear-gradient(to bottom, indigo, #A229D2)" : 
      "background: linear-gradient(to right, indigo, blue)"' 
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
      <v-card-text class='px-1'>
        <v-layout row wrap>
          <v-flex xs12 sm6 md5 pa-1>
            <v-layout column>
              <v-flex>
                <v-card style='border-radius: 8px;' class='elevation-8'>
                  <v-card-text>
                    <v-layout row wrap>
                      <v-flex xs12 sm4 lg5>
                        <v-card flat tile>
                          <v-card-title class='px-0'>
                            <v-layout column>
                              <v-flex>
                                <span class='' style='font-size: 16px;'>
                                  Collections 
                                </span>
                              </v-flex>
                              <v-flex>
                                <span class='grey--text'>Summary</span>
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
                                <!--<v-list-tile-avatar>-->
                                  <!--<v-icon small>date_range</v-icon>-->
                                  <!--</v-list-tile-avatar>-->
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
                      <v-flex xs12 sm8 lg7>
                        <v-card flat tile>
                          <v-card-text class='text-xs-justify'>
                            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                            tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
                            vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
                            no sea takimata sanctus est Lorem ipsum dolor sit amet.
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
              <v-flex class='pt-2'>
                <v-layout row wrap>
                  <v-flex xs12>
                    <v-card height='204' style='border-radius: 8px;'>
                    </v-card>
                  </v-flex>
                </v-layout>
              </v-flex>
            </v-layout>
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
          <v-flex xs12 sm5 md4 lg3 pa-1>
            <v-card style='border-radius: 8px;' class='elevation-8'>
              <v-card-title>
                <v-layout row wrap>
                  <v-flex xs3 lg2>
                    <v-avatar >
                      <v-icon large>
                        account_circle
                      </v-icon>
                    </v-avatar>
                  </v-flex>
                  <v-flex xs9 lg10>
                    <v-layout column>
                      <v-flex>
                        <strong style='font-size: 16px;font-weight: bold;'>Ellen Degeneres</strong>
                      </v-flex>
                      <v-flex>
                        <span class='grey--text'>Middle name dexter</span>
                      </v-flex>
                    </v-layout>
                  </v-flex>
                </v-layout>
              </v-card-title>
              <v-divider />
              <v-card-text class='pa-0'>
                <v-layout row wrap>
                  <v-flex xs9>
                    <v-list style='border-radius: 8px;' two-line subheader>
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
                  </v-flex>
                  <!--<v-divider vertical/>-->
                  <v-flex xs3>
                    <v-layout 
                      class='mt-3 d-flex align-center justify-content-center' 
                      style='width: 100%;' column wrap>
                      <v-flex :key='n' v-for='(i,n) in ["mail", "send", "payment"]'>
                        <v-btn 
                          small icon>
                          <v-icon small>
                            {{ i }}
                          </v-icon>
                        </v-btn>
                      </v-flex>
                    </v-layout>
                  </v-flex>
                </v-layout>
              </v-card-text>
            </v-card>
          </v-flex>
          <v-flex xs12 sm7 md8>
            <!--<v-layout row wrap>-->
              <!--<v-flex xs10>-->
                <v-card style='border-radius: 8px;' class='ma-1 elevation-8'>
                  <v-layout row wrap>
                    <v-flex xs12 lg3 pa-1>
                      <v-card flat style='border-radius: 8px;'>
                        <v-card-title>
                          <v-layout row wrap>
                            <v-flex xs3 sm4 lg3>
                              <v-avatar >
                                <v-icon large>
                                  account_circle
                                </v-icon>
                              </v-avatar>
                            </v-flex>
                            <v-flex d-flex xs9 sm8 lg9>
                              <v-layout column>
                                <v-flex>
                                  <strong style='font-size:18px;font-weight: bold;'>
                                    Data
                                  </strong>
                                </v-flex>
                                <v-flex>
                                  <span class='gery--text'>An algorithm</span>
                                </v-flex>
                              </v-layout>
                            </v-flex>
                          </v-layout>
                        </v-card-title>
                      </v-card>
                    </v-flex>
                    <v-divider vertical/>
                    <v-flex xs12 lg7>
                      <v-layout row wrap>
                        <v-flex xs12 md4>
                          <v-list>
                            <v-list-tile v-for='i in 5'>
                              <v-list-tile-content>
                                <v-list-tile-header>
                                  Supp
                                </v-list-tile-header>
                              </v-list-tile-content>
                            </v-list-tile>
                          </v-list>
                        </v-flex>
                        <v-divider vertical/>
                        <v-flex xs12 md7>
                        </v-flex>
                      </v-layout>
                    </v-flex>
                  </v-layout>
                </v-card>
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
    docGroup: null,
  }),
  methods: {
  }
}
</script>
