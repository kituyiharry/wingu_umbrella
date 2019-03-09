defmodule Wingu.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :description, :text
      add :company_id, references(:companies, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:events, [:company_id])
  end
end
