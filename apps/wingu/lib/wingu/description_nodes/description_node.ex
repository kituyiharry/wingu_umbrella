defmodule Wingu.DescriptionNodes.DescriptionNode do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "description_nodes" do
    field :isrequired, :boolean, default: false
    field :label, :string
    field :placeholder, :string
    field :section_nodes_id, :binary_id
    belongs_to :section_nodes, Wingu.SectionNodes.SectionNode, [define_field: false]
    has_many :text_node_data, Wingu.TextNodeData.TextNodeDatum

    timestamps()
  end

  @doc false
  def changeset(description_node, attrs) do
    description_node
    |> cast(attrs, [:label, :placeholder, :isrequired])
    |> validate_required([:label, :placeholder, :isrequired])
  end
end
