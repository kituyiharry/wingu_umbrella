defmodule Wingu.TextNodeData.TextNodeDatum do
  @moduledoc ~S"""
  #######################################################################
  #                            TextNodeData                             #
  #######################################################################

  Relates a given `Wingu.DescriptionNodes.DescriptionNode`
  """
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "text_node_data" do
    field :node_value, :string
    field :description_nodes_id, :binary_id
    field :section_data_id, :binary_id
    belongs_to :description_node, Wingu.DescriptionNodes.DescriptionNode,[define_field: :false, foreign_key: :description_nodes_id]
    belongs_to :section_datum, Wingu.SectionData.SectionDatum, [define_field: :false, foreign_key: :section_data_id]

    timestamps()
  end

  @doc false
  def changeset(text_node_datum, attrs) do
    text_node_datum
    |> cast(attrs, [:node_value])
    |> validate_required([:node_value])
    |> validate_length(:node_value, min: 3, max: 240)
  end
end
