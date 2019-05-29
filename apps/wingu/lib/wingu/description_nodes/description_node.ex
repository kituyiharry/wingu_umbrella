defmodule Wingu.DescriptionNodes.DescriptionNode do
  @moduledoc ~S"""
  #######################################################################
  #                           DescriptionNode                           #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  A DescriptionNode in a form containing labels an placeholder for data required
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "description_nodes" do
    field :isrequired, :boolean, default: false
    field :label, :string
    field :placeholder, :string
    field :summary, :string
    field :section_nodes_id, :binary_id

    belongs_to :section_node, Wingu.SectionNodes.SectionNode,
      define_field: false,
      foreign_key: :section_nodes_id

    has_many :text_node_data, Wingu.TextNodeData.TextNodeDatum, foreign_key: :description_nodes_id

    timestamps()
  end

  @doc false
  def changeset(description_node, attrs) do
    description_node
    |> cast(attrs, [:label, :placeholder, :isrequired])
    |> validate_required([:label, :placeholder, :isrequired])
    |> validate_length(:label, min: 3, max: 140)
    |> validate_length(:placeholder, min: 3, max: 140)
  end
end
