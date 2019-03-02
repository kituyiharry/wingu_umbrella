defmodule WinguWeb.GraphQL.Schema.Types do
  use Absinthe.Schema.Notation
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
    field  :email, :string
    field  :name, :string
  end

  object :event do   
    field :description, :string
    field :title, :string
    field :from, :datetime
    field :to, :datetime
  end

  object :station do
    field :name, :string
    field :meta, :string
  end

  input_object :add_company do
    field  :email, :string
    field  :name, :string
  end
end
