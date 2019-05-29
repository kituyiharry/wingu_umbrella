defmodule Wingu.Repo.Migrations.FormsClassIndex do
  use Ecto.Migration

  def change do
    create index(:forms, [:document_class_id])
  end
end
