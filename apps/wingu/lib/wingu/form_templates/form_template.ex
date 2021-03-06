defmodule Wingu.FormTemplates.FormTemplate do
  @moduledoc ~S"""
  #######################################################################
  #                            Form Template                            #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  A Form Template carries information about structure and descriptions of 
  sections and nodes in a form
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "form_templates" do
    field :forms_id, :binary_id

    has_many :sections_nodes, Wingu.SectionNodes.SectionNode,
      foreign_key: :form_templates_id,
      on_delete: :delete_all

    belongs_to :forms, Wingu.Forms.Form, define_field: false, foreign_key: :forms_id

    timestamps()
  end

  @doc false
  def changeset(form_template, attrs) do
    form_template
    |> cast(attrs, [])
    |> validate_required([])
  end
end
