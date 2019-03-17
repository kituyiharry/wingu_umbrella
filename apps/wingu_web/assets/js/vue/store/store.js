export default{
  state: {
    client: {}
  },
  mutations: {
    mutateClient(state, client){
      state.client = client
    }
  },
  actions: {
    prepareClient(context, clientModel){
      context.commit("mutateClient", clientModel)
    }
  }
}
