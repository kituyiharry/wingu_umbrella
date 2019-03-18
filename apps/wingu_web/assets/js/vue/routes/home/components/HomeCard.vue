<template>
  <v-card light flat height='410' class='ma-5' style='border-radius: 16px;'>
    <v-card-title>
      <v-btn color='primary' icon small outline>
        <v-icon small>
          business
        </v-icon>
      </v-btn>
      <span style='font-size: 1.525em; font-weight: bold;'>Register your business</span>
    </v-card-title>
    <v-divider />
    <v-card-text style='height:286px;overflow-y: scroll;'>
    </v-card-text>
    <v-divider />
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn small outline color='success' flat round>
        continue
        <v-icon small right>
          keyboard_arrow_right
        </v-icon>
      </v-btn>
    </v-card-actions>
  </v-card>
</template>
<script charset="utf-8">
export default{
  name: "HomeCard",
  data: () => ({
  })
}
</script>
