defmodule Wingu.Repo.Migrations.CreateFormTemplates do
  use Ecto.Migration

  def change do
    create table(:form_templates, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :forms_id, references(:forms, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:form_templates, [:forms_id])
  end
end
