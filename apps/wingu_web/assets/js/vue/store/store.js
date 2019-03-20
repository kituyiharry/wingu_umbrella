export default{
  state: {
    client: {},
    companies: []
  },
  mutations: {
    mutateClient(state, client){
      state.client = client
    },
    mutateCompanies(state, companies){
      state.companies= companies
    }
  },
  actions: {
    prepareClient(context, clientModel){
      context.commit("mutateClient", clientModel)
    },
    prepareCompanies(context, companyModel){
      context.commit("mutateCompanies", companyModel)
    }
  }
}
