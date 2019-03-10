defmodule WinguWeb.GraphQL.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Wingu.Repo

  import_types Absinthe.Type.Custom

  object :client do
    field :firstname,       :string
    field :surname,         :string
    field :id,              :id
    field :email_verified,  :boolean
    field :picture,         :string
    field  :email,          :string
  end

  object :company do
    field  :id,     :id
    field  :email,  :string
    field  :name,   :string
  end

  object :event do   
    field  :id,         :id
    field :description, :string
    field :title,       :string
    field :from,        :datetime
    field :to,          :datetime
  end

  object :station do
    field :name, :string
    field :meta, :string
  end

  object :description_node do
    field :id,          :id
    field :isrequired,  :boolean
    field :label,       :string
    field :placeholder, :string
  end

  object :plainform do
    field :name,        :string
    field :description, :string
    field :summary,     :string
  end

  object :form do
    field :id,             :id
    field :description,    :string
    field :name,           :string
    field :summary,        :string
    field :template,       :template,           resolve: assoc(:form_templates)
    field :form_data,      list_of(:form_data), resolve: assoc(:form_data)
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
    field :name,            :string
    field :description,     :string
    field :nodes,           list_of(:subnodes)
  end

  input_object :subnodes do
    field :required,    :boolean
    field :placeholder, :string
    field :label,       :string
  end

  object :form_data do
    field :client,    :client,                resolve: assoc(:client)
    field :sections,  list_of(:section_data), resolve: assoc(:section_data)
  end

  input_object :section_fill do
    field :section, :id
    field :nodes,   list_of(:value_fill)
  end

  input_object :value_fill do
    field :node,  :id
    field :value, :string
  end

  object :section_data do
    field :section, :section,            resolve: assoc(:section_node) 
    field :nodes,   list_of(:text_node), resolve: assoc(:text_node_data)
  end

  object :text_node do
    field :id,    :id
    field :value, :string,    resolve: key(:node_value)
    field :node,  :descnode,  resolve: assoc(:description_node)
  end

  object :template do
    field :id,        :id
    field :sections,  list_of(:section), resolve: assoc(:sections_nodes)
  end

  object :section do
    field :id,          :id
    field :name,        :string
    field :description, :string
    field :nodes,       list_of(:descnode), resolve: assoc(:description_nodes)
  end

  object :descnode do
    field :id,          :id
    field :isrequired,  :string
    field :label,       :string
    field :placeholder, :string
  end

  input_object :add_company do
    field  :email,  :string
    field  :name,   :string
  end

  input_object :add_event do
    field  :title,        :string
    field  :description,  :string
    field  :from,         :datetime
    field  :to,           :datetime
  end

  def key(value) do
    fn parent, _, _ -> {:ok, Map.get(parent, value)} end
  end
end
