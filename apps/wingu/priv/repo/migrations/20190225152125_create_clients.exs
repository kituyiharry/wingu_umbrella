defmodule Wingu.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :firstname, :string
      add :surname, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:clients, [:email])
  end
end
