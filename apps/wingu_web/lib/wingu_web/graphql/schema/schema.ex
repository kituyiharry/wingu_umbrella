defmodule WinguWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types WinguWeb.GraphQL.Schema.Types
  alias WinguWeb.GraphQL.Resolvers
  query do
    @desc "Information about the current client"
    field :client, :client do
      resolve &Resolvers.ClientResolver.client/3
    end
  end

  mutation do
    @desc "Create a company"
    field :new_company, :company do
      arg :company_params, :add_company
      arg :role, :string
      arg :description, :string
      resolve &Resolvers.CompanyResolver.create_company/3
    end
  end
end
