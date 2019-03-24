defmodule Wingu.DocumentClasses.DocumentClass do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "document_class" do
    field :class_description, :string
    field :classname, :string
    field :companies_id, :binary_id
    belongs_to :company, Wingu.Companies.Company, define_field: false, foreign_key: :companies_id
    has_many :forms, Wingu.Forms.Form, foreign_key: :document_class_id, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(document_class, attrs) do
    document_class
    |> cast(attrs, [:classname, :class_description])
    |> validate_required([:classname, :class_description])
  end
end
