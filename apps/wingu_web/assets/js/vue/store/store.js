export default{
  state: {
    client: {},
    companies: [],
    documentClasses: [],
    forms: {}
  },
  mutations: {
    mutateClient(state, client){
      state.client = client
    },
    mutateCompanies(state, companies){
      state.companies= companies
    },
    mutateDocClasses(state, documentClasses){
      state.documentClasses = documentClasses
    },
    mutateForms(state, docId, forms){
      state.forms[docId] = forms 
    }
  },
  actions: {
    prepareClient(context, clientModel){
      context.commit("mutateClient", clientModel)
    },
    prepareCompanies(context, companyModel){
      context.commit("mutateCompanies", companyModel)
    },
    prepareDocumentClasses(context, documentClasses){
      context.commit("mutateDocClasses", documentClasses)
    },
    prepareDocumentForms(context, docId, forms){
      context.commit("mutateDocForms", docId, forms)
    }
  }
}
