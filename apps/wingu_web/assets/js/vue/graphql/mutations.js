import gql from 'graphql-tag'

export const CREATE_COMPANY = gql`
  mutation CreateCompany($params: AddCompany, $role: String, $description: String){
    newCompany(companyParams: $params, role: $role, description: $description){
      id
      name
      email
    }
  }
`
