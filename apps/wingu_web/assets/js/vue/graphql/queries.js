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
