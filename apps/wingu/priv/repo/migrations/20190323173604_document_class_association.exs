defmodule Wingu.Repo.Migrations.DocumentClassAssociation do
  use Ecto.Migration

  def change do
    alter table(:forms) do
      add :document_class_id, references(:document_class, on_delete: :delete_all, type: :binary_id)
    end
  end
end
