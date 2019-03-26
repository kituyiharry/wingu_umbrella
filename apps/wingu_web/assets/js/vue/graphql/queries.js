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
  query CompanyEvents{
    companyEvents(companyId: "8b83339f-b60e-40a4-b169-afeec465ac0d"){
      id
      from
      to
      title
      description
    }
  }
`
