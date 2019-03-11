defmodule Wingu.SectionData.SectionDatum do
  @moduledoc ~S"""
  #######################################################################
  #                             SectionData                             #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  SectionData Collects various [`Wingu.TextNodeData.TextNodeDatum`] filled 
  for a certain [`Wingu.Forms.Form`]  
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "section_data" do
    field :form_data_id, :binary_id
    field :sections_nodes_id, :binary_id

    has_many :text_node_data, Wingu.TextNodeData.TextNodeDatum,
      foreign_key: :section_data_id,
      on_delete: :delete_all

    belongs_to :form_datum, Wingu.FormData.FormDatum,
      define_field: false,
      foreign_key: :form_data_id

    belongs_to :section_node, Wingu.SectionNodes.SectionNode,
      define_field: false,
      foreign_key: :sections_nodes_id

    timestamps()
  end

  @doc false
  def changeset(section_datum, attrs) do
    section_datum
    |> cast(attrs, [])
    |> validate_required([])
  end
end
