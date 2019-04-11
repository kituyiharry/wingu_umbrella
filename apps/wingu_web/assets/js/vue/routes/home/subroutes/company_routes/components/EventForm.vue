<template>
  <v-card :height='$vuetify.breakpoint.mdAndUp ? "286" : ""'>
    <v-card-title v-if='$vuetify.breakpoint.xsOnly' class='primary white--text'>
      <v-btn icon small color='secondary'>
        <v-icon small>
          add
        </v-icon>
      </v-btn>
      <v-layout column>
        <span class='mytitle'>
          <strong>
            New Events
          </strong>
        </span>
        <span style='font-size: 12px;'>Create a new calendar event</span>
      </v-layout>
    </v-card-title>
    <v-divider />
    <v-card-text class='pa-0'>
      <v-layout row wrap>
        <v-slide-x-transition>
          <v-flex v-show='$vuetify.breakpoint.smAndUp' xs12 sm5 md5>
            <v-card style='height:100%' class='white--text' height='286' flat tile color='primary'>
              <v-card-text>
                <v-layout column fill-height>
                  <v-flex>
                    <span style='font-size: 20px;' class='mytitle font-weight-bold'>New Event</span>
                  </v-flex>
                  <v-divider />
                  <v-flex>
                    <span class='subheader'>Create your new event</span>
                  </v-flex>
                </v-layout>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn @click='createEvent' color='green' small>
                  <v-icon small left>
                    save
                  </v-icon>
                  save
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-flex>
        </v-slide-x-transition>
        <v-flex xs12 sm7 md7
          :style='$vuetify.breakpoint.smAndUp ? "max-height:285px;overflow-y: scroll;" : ""'>
          <v-layout row wrap fill-height pa-2>
            <v-flex xs12>
              <v-text-field clearable v-model='title' name='' label='Title' box>
              </v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-textarea clearable v-model='description' box name='' label='description'>
              </v-textarea>
            </v-flex>
            <v-flex pa-1 xs12>
              <v-menu
                :close-on-content-click="false"
                :nudge-right="40" lazy transition="slide-y-reverse-transition"
                offset-y
                full-width
                min-width="290px"
                >
                <template v-slot:activator="{ on }">
                  <v-text-field
                    box
                    label="Picker without buttons"
                    prepend-inner-icon="event"
                    readonly
                    v-on="on"
                    :value="computedDateFromFormattedMomentjs"
                    ></v-text-field>
                </template>
                <v-date-picker :landscape='$vuetify.breakpoint.smAndUp' scrollable header-color='secondary' v-model="fromDate"></v-date-picker>
              </v-menu>
            </v-flex>
            <v-flex pa-1 xs12>
              <v-menu
                ref='fromMenu'
                :close-on-content-click="false"
                :nudge-right="40"
                :return-value.sync="fromTime"
                lazy
                transition="slide-y-transition"
                offset-y
                max-width="290px"
                min-width="290px"
                >
                <template v-slot:activator="{ on }">
                  <v-text-field
                    box
                    v-model="fromTime"
                    label="Picker in menu"
                    prepend-inner-icon="access_time"
                    readonly
                    v-on="on"
                    ></v-text-field>
                </template>
                <v-time-picker header-color='secondary'
                  v-model="fromTime"
                  @click:minute="$refs.fromMenu.save(fromTime)"
                  ></v-time-picker>
              </v-menu>
            </v-flex>
            <v-flex pa-1 xs12>
              <v-menu
                :close-on-content-click="false"
                :nudge-right="40"
                lazy
                transition="slide-y-reverse-transition"
                offset-y
                full-width
                min-width="290px"
                >
                <template v-slot:activator="{ on }">
                  <v-text-field
                    box 
                    label="Picker without buttons"
                    prepend-inner-icon="event"
                    readonly
                    v-on="on"
                    :value="computedDateToFormattedMomentjs"
                    ></v-text-field>
                </template>
                <v-date-picker :landscape='$vuetify.breakpoint.smAndUp' scrollable header-color='secondary' v-model="toDate"></v-date-picker>
              </v-menu>
            </v-flex>
            <v-flex pa-1 xs12>
              <v-menu
                ref='toMenu'
                :close-on-content-click="false"
                :nudge-right="40"
                :return-value.sync="toTime"
                lazy
                transition="slide-y-transition"
                offset-y
                max-width="290px"
                min-width="290px"
                >
                <template v-slot:activator="{ on }">
                  <v-text-field
                    box
                    v-model="toTime"
                    label="Picker in menu"
                    prepend-inner-icon="access_time"
                    readonly
                    v-on="on"
                    ></v-text-field>
                </template>
                <v-time-picker header-color='secondary'
                  v-model="toTime"
                  @click:minute="$refs.fromMenu.save(toTime)"
                  ></v-time-picker>
              </v-menu>
            </v-flex>
          </v-layout>
        </v-flex>
      </v-layout>
    </v-card-text>
  </v-card>
</template>
<script charset="utf-8">
import { CREATE_EVENT } from '../../../../../graphql/mutations.js'
export default {
  name: "EventForm",
  data: () => ({
    title: "",
    description: "",
    fromDate: new Date().toISOString().substr(0, 10),
    toDate: new Date().toISOString().substr(0, 10),
    fromTime: "00:01",
    toTime: "22:58"
  }),
  methods: {
    createEvent(){
      // TODO: Validate
      let fullFrom = this.fromDate.concat("-".concat(this.fromTime))
      let fullTo = this.toDate.concat("-".concat(this.toTime))
      let momentizedFrom = this.$moment(fullFrom, "YYYY-MM-DD-HH:mm")
      let momentizedTo = this.$moment(fullTo, "YYYY-MM-DD-HH:mm")
      this.$apollo.mutate({
        mutation: CREATE_EVENT,
        variables: {
          company: this.$route.params.id,
          params: {
            title: this.title,
            description: this.description,
            from: momentizedFrom.toISOString(),
            to: momentizedTo.toISOString(),
          }
        }
      }).catch(alert).then(alert)
    }
  },
  computed: {
    computedDateFromFormattedMomentjs(){
      return this.fromDate ? this.$moment(this.fromDate).format('ddd, MMMM Do YYYY') : ''
    },
    computedDateToFormattedMomentjs(){
      return this.toDate ? this.$moment(this.toDate).format('ddd, MMMM Do YYYY') : ''
    }
  }
}
</script>
