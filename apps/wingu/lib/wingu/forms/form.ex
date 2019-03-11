defmodule Wingu.Forms.Form do
  @moduledoc ~S"""
  #######################################################################
  #                                Form                                 #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  A Struct relating its internal structure [`Wingu.FormTemplates.FormTemplate`] 
  with associated data of [`Wingu.FormData.FormDatum`]
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "forms" do
    field :description, :string
    field :name, :string
    field :summary, :string
    field :companies_id, :binary_id
    belongs_to :company, Wingu.Companies.Company, define_field: false, foreign_key: :companies_id
    has_many :form_data, Wingu.FormData.FormDatum, foreign_key: :forms_id, on_delete: :delete_all

    has_one :form_templates, Wingu.FormTemplates.FormTemplate,
      foreign_key: :forms_id,
      on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(form, attrs) do
    form
    |> cast(attrs, [:name, :summary, :description])
    |> validate_required([:name, :summary, :description])
    |> validate_length(:name, min: 3, max: 63)
    |> validate_length(:summary, min: 3, max: 140)
    |> validate_length(:description, min: 3, max: 280)
  end
end
