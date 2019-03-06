defmodule Wingu.Repo.Migrations.CreateForms do
  use Ecto.Migration

  def change do
    create table(:forms, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :summary, :string
      add :description, :text
      add :companies_id, references(:companies, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:forms, [:companies_id])
  end
end
