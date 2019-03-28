import gql from 'graphql-tag'

export const CLIENT = gql`
  query ClientQuery{
    client{
      id
      email
      emailVerified
      firstname
      surname
      picture
    }
  }
`
export const COMPANIES = gql`
  query CompaniesQuery{
    myCompanies{
      id
      email
      name
    }
  }
`

export const EVENTS = gql`
  query CompanyEvents($iD: ID){
    companyEvents(companyId: $iD){
      id
      from
      to
      title
      description
    }
  }
`

export const COMPANY_DOC_CLASSES = gql`
  query CompanyDocClasses($iD: ID){
    documentClasses(companyId: $iD){
      id
      classname
      classDescription
    }
  }
`

export const DOC_CLASS_FORMS = gql`
  query DocForms($iD: ID){
    docForms(docclass: $iD){
      id
      name
    }
  }
`
