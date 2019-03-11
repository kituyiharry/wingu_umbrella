defmodule Wingu.FormData.FormDatum do
  @moduledoc ~S"""
  #######################################################################
  #                             Form Datum                              #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  Collects a set of data connected to a form based on a template on the associated
  form
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "form_data" do
    field :forms_id, :binary_id
    field :clients_id, :binary_id

    has_many :section_data, Wingu.SectionData.SectionDatum,
      foreign_key: :form_data_id,
      on_delete: :delete_all

    belongs_to :form, Wingu.Forms.Form, define_field: false, foreign_key: :forms_id
    belongs_to :client, Wingu.Clients.Client, define_field: false, foreign_key: :clients_id

    timestamps()
  end

  @doc false
  def changeset(form_datum, attrs) do
    form_datum
    |> cast(attrs, [])
    |> validate_required([])
  end
end
