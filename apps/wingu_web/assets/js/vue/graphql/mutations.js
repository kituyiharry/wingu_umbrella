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

export const CREATE_DOC_CLASS = gql`
  mutation CreateDocClass($company: ID, $description: String, $name: String){
    createDocClass(company: $company, name: $name, description: $description){
      id
      classname
      classDescription
    }
  }
`

export const CREATE_FORM = gql`
  mutation NewForm($company: ID, $docclass: ID, $form: FormChange){
    newForm(form: $form, docclass: $docclass, form: $form){
      id
      name
      summary
      description
    }
  }
`

export const CREATE_EVENT = gql`
  mutation NewEvent($company: ID, $params: AddEvent){
    newEvent(companyId: $company, eventParams: $params){
      id
      to
      from 
      title
      description
    }
  }
`

export const DELETE_FORM = gql`
  mutation DeleteForm($form: ID){
    deleteForm(form: $form){
      name
      description
    }
  }
`
