defmodule Wingu.Repo.Migrations.CreateDocumentClass do
  use Ecto.Migration

  def change do
    create table(:document_class, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :classname, :string
      add :class_description, :text
      add :companies_id, references(:companies, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:document_class, [:companies_id])
  end
end
