defmodule Wingu.TextNodeData.TextNodeDatum do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "text_node_data" do
    field :node_value, :string
    field :description_nodes_id, :binary_id
    field :section_data_id, :binary_id
    belongs_to :description_nodes, Wingu.DescriptionNodes.DescriptionNode,[define_field: :false]
    belongs_to :section_data, Wingu.SectionData.SectionDatum, [define_field: :false]

    timestamps()
  end

  @doc false
  def changeset(text_node_datum, attrs) do
    text_node_datum
    |> cast(attrs, [:node_value])
    |> validate_required([:node_value])
  end
end
