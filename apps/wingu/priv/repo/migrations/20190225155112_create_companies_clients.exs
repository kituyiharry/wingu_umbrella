defmodule Wingu.Repo.Migrations.CreateCompaniesClients do
  use Ecto.Migration

  def change do
    create table(:companies_clients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :role, :string
      add :description, :text
      add :companies_id, references(:companies, on_delete: :nothing, type: :binary_id)
      add :clients_id, references(:clients, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:companies_clients, [:companies_id])
    create index(:companies_clients, [:clients_id])
  end
end
