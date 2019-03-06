defmodule Wingu.SectionNodes.SectionNode do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "section_nodes" do
    field :description, :string
    field :name, :string
    field :form_templates_id, :binary_id
    has_many :description_nodes, Wingu.DescriptionNodes.DescriptionNode, foreign_key: :section_nodes_id
    has_many  :section_data, Wingu.SectionData.SectionDatum, foreign_key: :sections_nodes_id
    belongs_to :form_template, Wingu.FormTemplates.FormTemplate, [define_field: false, foreign_key: :form_templates_id]

    timestamps()
  end

  @doc false
  def changeset(section_node, attrs) do
    section_node
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
