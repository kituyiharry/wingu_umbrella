defmodule Wingu.SectionData.SectionDatum do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "section_data" do
    field :form_data_id, :binary_id
    field :sections_nodes_id, :binary_id
    has_many :text_node_data, Wingu.TextNodeData.TextNodeDatum
    belongs_to :form_data, Wingu.FormData.FormDatum, [define_field: false]
    belongs_to :section_nodes, Wingu.SectionNodes.SectionNode, [define_field: false]

    timestamps()
  end

  @doc false
  def changeset(section_datum, attrs) do
    section_datum
    |> cast(attrs, [])
    |> validate_required([])
  end
end
