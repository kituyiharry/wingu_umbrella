defmodule WinguWeb.GraphQL.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Wingu.Repo

  import_types Absinthe.Type.Custom

  object :item do
    field :id, :id
    field :name, :string
  end

  object :client do
    field :firstname, :string
    field :surname, :string
    field :id, :id
    field :email_verified, :boolean
    field :picture, :string
    field  :email, :string
  end

  object :company do
    field  :id, :id
    field  :email, :string
    field  :name, :string
  end

  object :event do   
    field  :id, :id
    field :description, :string
    field :title, :string
    field :from, :datetime
    field :to, :datetime
  end

  object :station do
    field :name, :string
    field :meta, :string
  end

  object :description_node do
    field :isrequired, :boolean
    field :label, :string
    field :placeholder, :string
  end

  object :form do
    field :description,    :string
    field :name,           :string
    field :summary,        :string
    field :template,       :template, resolve: assoc(:form_templates)
  end

  input_object :form_change do
    field :name,        :string
    field :summary,     :string
    field :description, :string
    field :template,    :form_template_change
  end

  input_object :form_template_change do
    field :sections, list_of(:form_section)
  end

  input_object :form_section do
    field :name, :string
    field :description, :string
    field :nodes, list_of(:subnodes)
  end

  input_object :subnodes do
    field :required, :boolean
    field :placeholder, :string
    field :label, :string
  end

  object :data do
    field :client, :client
    field :sections, list_of(:section_data)
  end

  object :section_data do
    field :section, :section 
    field :nodes, list_of(:text_node)
  end

  object :text_node do
    field :value, :string
    field :node, :descnode
  end

  object :template do
    field :sections, list_of(:section), resolve: assoc(:sections_nodes)
  end

  object :section do
    field :name, :string
    field :description, :string
    field :nodes, list_of(:descnode), resolve: assoc(:description_nodes)
  end

  object :descnode do
    field :isrequired, :string
    field :label, :string
    field :placeholder, :string
  end

  input_object :add_company do
    field  :email, :string
    field  :name, :string
  end

  input_object :add_event do
    field  :title, :string
    field  :description, :string
    field  :from, :datetime
    field  :to, :datetime
  end
end
