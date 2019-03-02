defmodule WinguWeb.GraphQL.Schema.Types do
  use Absinthe.Schema.Notation

  object :item do
    field :id, :id
    field :name, :string
  end

  object :client do
    field :firstname, :string
    field :surname, :string
    field :id, :binary_id
    field :email_verified, :boolean
    field :picture, :string
    field  :email, :string
  end

  object :company do
    field  :email, :string
    field  :name, :string
  end

  object :event do   
    field :description, :text
    field :title, :string
    field :from, :utc_datetime
    field :to, :utc_datetime
  end

  object :station do
    field :name, :string
    field :meta, :string
  end
end
