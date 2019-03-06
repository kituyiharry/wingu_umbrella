defmodule Wingu.SectionNodes.SectionNode do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "section_nodes" do
    field :description, :string
    field :name, :string
    field :form_templates_id, :binary_id
    has_many :description_nodes, Wingu.DescriptionNodes.DescriptionNode
    has_many  :section_data, Wingu.SectionData.SectionDatum 
    belongs_to :form_templates, Wingu.FormTemplates.FormTemplate, [define_field: false ]

    timestamps()
  end

  @doc false
  def changeset(section_node, attrs) do
    section_node
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
