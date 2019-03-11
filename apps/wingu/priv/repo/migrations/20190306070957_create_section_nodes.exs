defmodule Wingu.Repo.Migrations.CreateSectionNodes do
  use Ecto.Migration

  def change do
    create table(:section_nodes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :text

      add :form_templates_id,
          references(:form_templates, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:section_nodes, [:form_templates_id])
  end
end
