export default{
  state: {
    home: "Home",
    client: {},
    companies: [],
    documentClasses: [],
    forms: {},
    events: {}
  },
  mutations: {
    mutateClient(state, client){
      state.client = client
    },
    mutateTitle(state, title){
      state.home = title
    },
    mutateCompanies(state, companies){
      state.companies= companies
    },
    mutateDocClasses(state, documentClasses){
      state.documentClasses = documentClasses
    },
    mutateForms(state, docId, forms){
      state.forms[docId] = forms 
    },
    mutateEvents(state, {id, ev}){
      state.events[id] = ev
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
    },
    prepareEvents(context, {id, ev}){
      context.commit("mutateEvents", {id: id, ev: ev})
    }
  }
}
