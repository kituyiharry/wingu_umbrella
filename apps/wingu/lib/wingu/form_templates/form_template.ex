defmodule Wingu.FormTemplates.FormTemplate do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "form_templates" do
    field :forms_id, :binary_id
    has_many :sections_nodes, Wingu.SectionNodes.SectionNode
    belongs_to :forms, Wingu.Forms.Form,[define_field: false]

    timestamps()
  end

  @doc false
  def changeset(form_template, attrs) do
    form_template
    |> cast(attrs, [])
    |> validate_required([])
  end
end
