<template>
  <v-card color='accent darken-3' flat>
    <v-card-text class='pa-0'>
      <v-layout row wrap>
        <v-flex xs12>
          <v-card color='accent darken-3' flat tile min-height='382'>
            <v-card-text class='text-xs-center'>
              Create a section with inputs
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-card-text>
    <v-divider />
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn flat round>
        Add Section
      </v-btn>
    </v-card-actions>
  </v-card>
</template>
<script charset="utf-8">
export default {
  name: "FormWizard",
  data: () => ({
  })
}
</script>
