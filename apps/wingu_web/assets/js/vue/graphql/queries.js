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
