defmodule Wingu.SectionNodes.SectionNode do
  @moduledoc ~S"""
  #######################################################################
  #                             SectionNode                             #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  Associates a given `Wingu.FormTemplates.FormTemplate` with its 
  `Wingu.DescriptionNodes.DescriptionNode`
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "section_nodes" do
    field :description, :string
    field :name, :string
    field :summary, :string
    field :form_templates_id, :binary_id

    has_many :description_nodes, Wingu.DescriptionNodes.DescriptionNode,
      foreign_key: :section_nodes_id,
      on_delete: :delete_all

    has_many :section_data, Wingu.SectionData.SectionDatum, foreign_key: :sections_nodes_id

    belongs_to :form_template, Wingu.FormTemplates.FormTemplate,
      define_field: false,
      foreign_key: :form_templates_id

    timestamps()
  end

  @doc false
  def changeset(section_node, attrs) do
    section_node
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> validate_length(:name, min: 3, max: 63)
    |> validate_length(:description, min: 3, max: 280)
  end
end
