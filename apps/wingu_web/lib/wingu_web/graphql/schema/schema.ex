defmodule WinguWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types WinguWeb.GraphQL.Schema.Types
  alias WinguWeb.GraphQL.Resolvers
  query do
    @desc "Information about the current client"
    field :client, :client do
      resolve &Resolvers.ClientResolver.client/3
    end

    @desc "Companies created or a part of the users context"
    field :my_companies, list_of(:company) do
      resolve &Resolvers.CompanyResolver.my_companies/3
    end

    @desc "Events created within a company"
    field :company_events, list_of(:event) do
      arg :company_id, :id 
      resolve &Resolvers.EventResolver.company_events/3
    end

    @desc "Forms created by a company"
    field :forms, list_of(:form) do
      arg :company, :id
      resolve &Resolvers.FormResolver.forms/3
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

    @desc "Delete a Company"
    field :delete_company, :company do
      arg :id, :id
      resolve &Resolvers.CompanyResolver.delete/3
    end

    @desc "Update company with new information"
    field :update_company, :company do
      arg :id, :id
      arg :change, :add_company
      resolve &Resolvers.CompanyResolver.update_company/3
    end

    @desc "Create a new Event"
    field :new_event, :event do
      arg :company_id, :id
      arg :event_params, :add_event
      resolve &Resolvers.EventResolver.create_events/3
    end

    @desc "Update events with new information"
    field :update_event, :company do
      arg :id, :id
      arg :change, :add_event
      resolve &Resolvers.EventResolver.update_event/3
    end

    @desc "Delete an Event"
    field :delete_event, :event do
      arg :id, :id
      resolve &Resolvers.EventResolver.delete_event/3
    end

    @desc "Create new Form information"
    field :new_form, :form do
      arg :company, :id
      arg :form, :form_change
      # Use Catch all here for context implementations!!
      #resolve fn _, _a, _b -> {:error, "Not implemented"} end
      resolve &Resolvers.FormResolver.create_form/3
    end

    @desc "Create form data"
    field :fill_form, :form_data do
      arg :form_id, :id
      arg :data, list_of(:section_fill)
      resolve &Resolvers.FormResolver.fill_form/3
    end
  end
end
