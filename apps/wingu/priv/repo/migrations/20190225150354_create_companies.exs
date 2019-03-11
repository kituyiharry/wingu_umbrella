defmodule Wingu.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :name, :text

      timestamps()
    end

    create unique_index(:companies, [:email])
  end
end
