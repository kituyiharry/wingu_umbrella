defmodule Wingu.Repo.Migrations.CreateStations do
  use Ecto.Migration

  def change do
    create table(:stations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :meta, :text
      add :company_id, references(:companies, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:stations, [:company_id])
  end
end
