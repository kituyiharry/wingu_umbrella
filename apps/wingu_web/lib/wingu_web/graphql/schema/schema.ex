defmodule WinguWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types(WinguWeb.GraphQL.Schema.Types)
  alias WinguWeb.GraphQL.Resolvers
  require IO

  query do
    @desc "Information about the current client"
    field :client, :client do
      middleware(:handle_auth)
      resolve(&Resolvers.ClientResolver.client/3)
    end

    @desc "Companies created or a part of the users context"
    field :my_companies, list_of(:company) do
      middleware(:handle_auth)
      resolve(&Resolvers.CompanyResolver.my_companies/3)
    end

    @desc "Events created within a company"
    field :company_events, list_of(:event) do
      arg(:company_id, :id)
      middleware(:handle_auth)
      resolve(&Resolvers.EventResolver.company_events/3)
    end

    @desc "Forms created by a company"
    field :forms, list_of(:form) do
      arg(:company, :id)
      middleware(:handle_auth)
      resolve(&Resolvers.FormResolver.forms/3)
    end

    @desc "Forms belonging to a docclass"
    field :doc_forms, list_of(:form) do
      arg(:docclass, :id)
      middleware(:handle_auth)
      resolve(&Resolvers.FormResolver.forms/3)
    end

    @desc "Get DocumentClasses of a company"
    field :document_classes, list_of(:docclass) do
      arg(:company_id, :id)
      middleware(:handle_auth)
      resolve(&Resolvers.DocumentClassResolver.get_doc_classes/3)
    end

    field :docclassinfo, :docclass do
      arg :id, :id
      middleware(:handle_auth)
      resolve(&Resolvers.DocumentClassResolver.docclassinfo/3)
    end
  end

  mutation do
    @desc "Create a company"
    field :new_company, :company do
      arg(:company_params, :add_company)
      arg(:role, :string)
      arg(:description, :string)
      middleware(:handle_auth)
      resolve(&Resolvers.CompanyResolver.create_company/3)
    end

    @desc "Delete a Company"
    field :delete_company, :company do
      arg(:id, :id)
      middleware(:handle_auth)
      resolve(&Resolvers.CompanyResolver.delete/3)
    end

    @desc "Update company with new information"
    field :update_company, :company do
      arg(:id, :id)
      arg(:change, :add_company)
      middleware(:handle_auth)
      resolve(&Resolvers.CompanyResolver.update_company/3)
    end

    @desc "Create a new Event"
    field :new_event, :event do
      arg(:company_id, :id)
      arg(:event_params, :add_event)
      middleware(:handle_auth)
      resolve(&Resolvers.EventResolver.create_events/3)
    end

    @desc "Update events with new information"
    field :update_event, :company do
      arg(:id, :id)
      arg(:change, :add_event)
      middleware(:handle_auth)
      resolve(&Resolvers.EventResolver.update_event/3)
    end

    @desc "Delete an Event"
    field :delete_event, :event do
      arg(:id, :id)
      middleware(:handle_auth)
      resolve(&Resolvers.EventResolver.delete_event/3)
    end

    @desc "Create new Form information"
    field :new_form, :form do
      arg(:company, :id)
      arg(:docclass, :id)
      arg(:form, :form_change)
      # Use Catch all here for context implementations!!
      # resolve fn _, _a, _b -> {:error, "Not implemented"} end
      middleware(:handle_auth)
      resolve(&Resolvers.FormResolver.create_form/3)
    end

    @desc "Create form data"
    field :fill_form, :form_data do
      arg(:form_id, :id)
      arg(:data, list_of(:section_fill))
      middleware(:handle_auth)
      resolve(&Resolvers.FormResolver.fill_form/3)
    end

    @desc "Delete a form and all associated data"
    field :delete_form, :plainform do
      arg(:form, :id)
      middleware(:handle_auth)
      resolve(&Resolvers.FormResolver.delete_form/3)
    end

    @desc "Create a Document Class"
    field :create_doc_class, :docclass do
      arg(:company, :id)
      arg(:name, :string)
      arg(:description, :string)
      middleware(:handle_auth)
      resolve(&Resolvers.DocumentClassResolver.create_doc_class/3)
    end
  end

  @doc "Return resolution when context is authenticated"
  def handle_auth(%{context: %{"sub" => _sub}} = resolution, _config) do
    resolution
  end

  @doc "Return error if not auth"
  def handle_auth(resolution, _config) do
    resolution |> Absinthe.Resolution.put_result({:error, "Unathenticated"})
  end
end
