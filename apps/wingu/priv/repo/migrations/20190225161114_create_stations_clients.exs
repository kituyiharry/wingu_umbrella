defmodule Wingu.Repo.Migrations.CreateStationsClients do
  use Ecto.Migration

  def change do
    create table(:stations_clients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :stations_id, references(:stations, on_delete: :nothing, type: :binary_id)
      add :clients_id, references(:clients, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:stations_clients, [:stations_id])
    create index(:stations_clients, [:clients_id])
  end
end
