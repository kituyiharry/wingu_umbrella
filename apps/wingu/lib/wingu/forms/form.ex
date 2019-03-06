defmodule Wingu.Forms.Form do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "forms" do
    field :description, :string
    field :name, :string
    field :summary, :string
    field :companies_id, :binary_id
    has_many :form_data, Wingu.FormData.FormDatum
    has_many :form_templates, Wingu.FormTemplates.FormTemplate

    timestamps()
  end

  @doc false
  def changeset(form, attrs) do
    form
    |> cast(attrs, [:name, :summary, :description])
    |> validate_required([:name, :summary, :description])
  end
end
