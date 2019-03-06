defmodule Wingu.FormData.FormDatum do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "form_data" do
    field :forms_id, :binary_id
    field :clients_id, :binary_id
    field :client_id, :binary_id, source: :clients_id, virtual: true
    has_many :section_data, Wingu.SectionData.SectionDatum
    belongs_to :forms, Wingu.Forms.Form, define_field: false
    belongs_to :clients, Wingu.Clients.Client, define_field: false

    timestamps()
  end

  @doc false
  def changeset(form_datum, attrs) do
    form_datum
    |> cast(attrs, [])
    |> validate_required([])
  end
end
