<template>
  <v-container 
    fluid :class='$vuetify.breakpoint.smAndDown ? 
    "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-dialog lazy max-width='800' scrollable :fullscreen='$vuetify.breakpoint.xsOnly' 
      transition='slide-y-transition' v-model='showDocGroup'>
      <DocGroups @closeDialog='()=>{ showDocGroup=!showDocGroup; }' showDocClassForm='showDocGroup'/>
    </v-dialog>
    <v-dialog lazy max-width='800' scrollable 
      :fullscreen='$vuetify.breakpoint.xsOnly' 
      transition='slide-y-transition' v-model='showCreateDocClass'>
      <FormWizard @closeDialog='()=> { showCreateDocClass=!showCreateDocClass; }' />
    </v-dialog>
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
        <!--<v-menu :close-on-content-click='false' slide-y-transition offset-y>-->
          <!--<div>-->
            <!--<div class="up-arrow" style='margin-left: 30px;'>-->
            <!--</div>-->
            <!--<v-card class='elevation-5'>-->
              <!--<v-card-title>-->
                <!--<strong style='font-size:16px;' class='px-3'>Collections</strong>-->
              <!--</v-card-title>-->
              <!--<v-divider />-->
              <!--<v-card-text style='height:200px;overflow-y: auto;'>-->
              <!--</v-card-text>-->
            <!--</v-card>-->
          <!--</div>-->
          <!--<v-card slot='activator' class='elevation-3' style='border-radius: 8px;'>-->
            <!--<v-list two-line dense subheader>-->
              <!--<v-subheader>-->
                <!--Select a document-->
              <!--</v-subheader>-->
              <!--<v-divider />-->
              <!--<v-list-tile-->
                <!--avatar ripple-->
                <!--@click="">-->
                <!---->
                <!--<v-list-tile-avatar>-->
                  <!--<v-avatar size='32'>-->
                    <!--<v-icon>settings</v-icon>-->
                  <!--</v-avatar>-->
                <!--</v-list-tile-avatar>-->

                <!--<v-list-tile-content>-->
                  <!--<v-list-tile-title>Medical Records</v-list-tile-title>-->
                  <!--<v-list-tile-sub-title>A Wordy insert Description here</v-list-tile-sub-title>-->
                <!--</v-list-tile-content>-->

                <!--[><v-list-tile-action><]-->
                  <!--[><v-btn icon ripple><]-->
                    <!--[><v-icon color="grey lighten-1">info</v-icon><]-->
                    <!--[></v-btn><]-->
                  <!--[></v-list-tile-action><]-->
              <!--</v-list-tile>-->

            <!--</v-list>-->
          <!--</v-card>-->
        <!--</v-menu>-->
      </v-card-actions>
      <v-divider />
      <v-card-text class='px-0'>
        <v-layout row wrap>
          <v-flex order-xs2 xs12 sm6 md5 pa-1>
            <v-layout column>
              <v-flex>
                <v-card style='border-radius: 8px;' class='elevation-8'>
                  <v-card-title>
                    <!--<v-layout column>-->
                      <!--<v-flex>-->
                        <span class='' style='font-weight: bold;font-size: 18px;'>
                          Responses
                        </span>
                        <!--</v-flex>-->
                      <!--<v-flex pr-1>-->
                        <!--<span class='grey--text'>Summary</span>-->
                        <!--<v-text-field hide-details -->
                          <!--name='' label='Search' append-inner-icon='search'>-->
                          <!--</v-text-field>-->
                        <!--</v-flex>-->
                      <!--</v-layout>-->
                  </v-card-title>
                  <!--<v-card-actions>-->
                    <!--<v-spacer></v-spacer>-->
                    <!--<v-text-field solo-inverted hide-details name='' label='Search'>-->
                      <!--</v-text-field>-->
                    <!--</v-card-actions>-->
                  <v-divider />
                  <v-card-text class='pa-0'>
                    <v-layout row wrap>
                      <v-flex order-xs1 order-md2 xs12 md4 lg5>
                        <v-card flat tile>
                          <v-divider />
                          <v-card-text class='pa-0'>
                            <v-card style='border-radius: 8px;' flat tile>
                              <v-card-text class='pt-4'>
                                <v-layout row wrap>
                                  <v-flex xs12>
                                    <v-layout column>
                                      <v-flex d-flex align-center justify-content-center>
                                        <v-avatar data-aos='zoom-in' size='56'>
                                          <img src="https://avataaars.io/?avatarStyle=Circle&topType=ShortHairFrizzle&accessoriesType=Prescription02&hairColor=Black&facialHairType=MoustacheMagnum&facialHairColor=BrownDark&clotheType=BlazerSweater&clotheColor=Black&eyeType=Default&eyebrowType=FlatNatural&mouthType=Default&skinColor=Tanned" alt=''>
                                        </v-avatar>
                                      </v-flex>
                                      <v-flex class='text-xs-center'>
                                        <v-layout column>
                                          <v-flex py-1>
                                            <strong style="font-size: 16px;">Thanos Guy</strong>
                                          </v-flex>
                                          <v-flex>
                                            <span class='grey--text' style="font-size: 12px;">
                                              F, 32yrs old
                                            </span>
                                          </v-flex>
                                          <v-flex>
                                            <v-btn @click='showDocGroup=true' small outline>
                                              <v-icon small left>
                                                open_in_new
                                              </v-icon>
                                              open
                                            </v-btn>
                                          </v-flex>
                                        </v-layout>
                                      </v-flex>
                                    </v-layout>
                                  </v-flex>
                                </v-layout>
                              </v-card-text>
                            </v-card>
                          </v-card-text>
                        </v-card>
                      </v-flex>
                      <!--<v-divider vertical/>-->
                      <v-flex order-xs2 order-md1 xs12 md8 lg7>
                        <v-text-field clearable hide-details append-icon='search' solo-inverted flat  
                          name='' label='Search'>
                        </v-text-field>
                        <v-divider />
                        <v-card style='overflow-y: scroll;border-radius: 8px;' maxHeight='300' flat tile>
                          <v-card-text class='pa-0 text-xs-justify'>
                            <v-list two-line subheader>
                              <v-subheader>Recent chat</v-subheader>
                              <v-divider />
                              <v-list-tile
                                v-for="(item, ind) in items"
                                :key="ind"
                                avatar
                                @click=""
                                >
                                <v-list-tile-avatar>
                                  <img :src="item.avatar">
                                </v-list-tile-avatar>

                                <v-list-tile-content>
                                  <v-list-tile-title v-html="item.title"></v-list-tile-title>
                                  <v-list-tile-sub-title v-html='item.avatar'/> 
                                </v-list-tile-content>

                                <v-list-tile-action>
                                  <v-icon small :color="item.active ? 'teal' : 'grey'">chat_bubble</v-icon>
                                </v-list-tile-action>
                              </v-list-tile>
                            </v-list>

                            <v-divider></v-divider>

                            <v-list subheader>
                              <v-subheader>Previous chats</v-subheader>

                              <v-list-tile
                                v-for="(item,ind) in items2"
                                :key="ind"
                                avatar v-ripple
                                @click=""
                                >
                                <v-list-tile-avatar>
                                  <img :src="item.avatar">
                                </v-list-tile-avatar>

                                <v-list-tile-content>
                                  <v-list-tile-title v-html="item.title"></v-list-tile-title>
                                </v-list-tile-content>
                              </v-list-tile>
                            </v-list>
                          </v-card-text>
                        </v-card>
                      </v-flex>
                    </v-layout>
                  </v-card-text>
                  <v-divider />
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn small outline>
                      reload
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-flex>
            </v-layout>
          </v-flex>
          <v-flex order-xs1 xs12 sm6 md7 pa-1>
            <v-card style='border-radius: 8px;' class='elevation-8'>
              <v-card-title>
                <v-layout column>
                  <v-flex>
                    <v-menu transition='slide-y-transition' attach>
                      <div slot='activator'>
                        <strong style='font-size: 20px;'>Medical Records</strong>
                        <v-btn small icon color='transparent'>
                          <v-icon small>
                            menu
                          </v-icon>
                        </v-btn>
                      </div>
                      <v-card style='border-radius: 8px;' width='300'>
                        <v-toolbar flat color="secondary lighten-3" light>
                          <!--<v-toolbar-side-icon></v-toolbar-side-icon>-->
                          <v-toolbar-title class="black--text text-xs-center">New Chat</v-toolbar-title>
                          <v-spacer></v-spacer>
                          <v-btn icon small>
                            <v-icon small>add</v-icon>
                          </v-btn>
                          <v-btn icon small>
                            <v-icon small>search</v-icon>
                          </v-btn>
                        </v-toolbar>
                        <v-list subheader two-line 
                          style='max-height: 250px; overflow-y: scroll; border-radius: 8px;'>
                          <v-subheader>Recent chat</v-subheader>
                          <v-list-tile
                            v-for="(item,ind) in items"
                            :key="ind"
                            avatar
                            @click=""
                            >
                            <v-list-tile-avatar>
                              <img :src="item.avatar">
                            </v-list-tile-avatar>
                            <v-list-tile-content>
                              <v-list-tile-title v-html="item.title"></v-list-tile-title>
                              <v-list-tile-sub-title v-html="item.title"></v-list-tile-sub-title>
                              <v-divider />
                            </v-list-tile-content>
                            <v-list-tile-action>
                              <v-icon :color="item.active ? 'teal' : 'grey'">chat_bubble</v-icon>
                            </v-list-tile-action>
                          </v-list-tile>
                        </v-list>
                        <v-divider />
                        <v-card-actions>

                        </v-card-actions>
                      </v-card>
                    </v-menu>
                  </v-flex>
                  <v-flex>
                    <span style='font-size: 12px;' class='grey--text'>
                      16 documents
                    </span>
                  </v-flex>
                </v-layout>
                <v-spacer></v-spacer>
                <!--<v-text-field-->
                  <!--v-model="search"-->
                  <!--append-icon="search"-->
                  <!--label="Search"-->
                  <!--single-line solo-inverted-->
                  <!--hide-details-->
                  <!--</v-text-field>-->
              </v-card-title>
              <!--
              -<v-card-actions>
                -  <v-spacer></v-spacer>
                -  <v-select
                  -    :items="$store.state.store.documentClasses"
                  -    label="Outline style" chips
                  -    v-model='docGroup'
                  -    item-text='classname'
                  -    return-object
                  -    outline
                  -    ></v-select>
                -</v-card-actions>
              -->
              <v-divider />
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn @click='showCreateDocClass=true' flat small outline>
                  <v-icon small left>
                    add
                  </v-icon>
                  create
                </v-btn>
              </v-card-actions>
              <v-divider />
              <v-card-text class='px-0'>
                <v-layout class='py-3' row style='min-height:160px;overflow-x: scroll;'>
                  <v-flex xs6>
                    <v-card width='50' flat tile color='transparent'>
                    </v-card>
                  </v-flex>
                  <v-flex xs12 px-1 v-for='i in 16' :key='i'>
                    <v-card color='primary' hover flat height='150' width='230'>
                    </v-card>
                  </v-flex>
                  <v-flex xs6>
                    <v-card width='50' flat tile color='transparent'>
                    </v-card>
                  </v-flex>
                </v-layout>
              </v-card-text>
              <v-divider />
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn small flat outline>
                  <v-icon small left>
                    edit
                  </v-icon>
                  edit
                </v-btn> 
                <v-btn outline small flat>
                  <v-icon small left>
                    delete
                  </v-icon>
                  delete
                </v-btn>
              </v-card-actions>
              <v-card-text>
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
                vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
                no sea takimata sanctus est Lorem ipsum dolor sit amet.
              </v-card-text>
              <v-divider />
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn @click='showDocGroup=!showDocGroup' flat round>
                  hide
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-flex>
        </v-layout>
      </v-card-text>
    </v-card>
  </v-container>
</template>
<script charset="utf-8">
import DocGroups from "./components/DocGroups.vue";
import FormWizard from "./components/FormWizard.vue";
export default {
  name: "Records",
  components: { DocGroups, FormWizard },
  data: () => ({
    drawerItems: [
      { title: 'Home', icon: 'dashboard' },
      { title: 'About', icon: 'question_answer' },
      { title: 'Home', icon: 'dashboard' },
      { title: 'About', icon: 'question_answer' },
      { title: 'Home', icon: 'dashboard' },
      { title: 'About', icon: 'question_answer' },
    ],
    items: [
      { active: true, title: 'Jason Oner', avatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg' },
      { active: true, title: 'Ranee Carlson', avatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg' },
      { title: 'Cindy Baker', avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' },
      { title: 'Cindy Baker', avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' },
      { title: 'Ali Connors', avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg' },
      { title: 'Cindy Baker', avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' },
      { title: 'Ali Connors', avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg' },
      { title: 'Cindy Baker', avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' },
      { title: 'Ali Connors', avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg' },
      { title: 'Cindy Baker', avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' },
      { title: 'Ali Connors', avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg' },
      { title: 'Cindy Baker', avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' },
      { title: 'Ali Connors', avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg' },
      { title: 'Ali Connors', avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg' },
    ],
    items2: [
      { title: 'Travis Howard', avatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg' },
      { title: 'Cindy Baker', avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' },
      { title: 'Ali Connors', avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg' },
    ],
    search: '',
    docGroup: null,
    showDocGroup: false,
    showCreateDocClass: false
  }),
  methods: {
  }
}
</script>
