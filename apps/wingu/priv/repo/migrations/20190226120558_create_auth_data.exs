defmodule Wingu.Repo.Migrations.CreateAuthData do
  use Ecto.Migration

  def change do
    create table(:auth_data, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :token_type, :string
      add :access_token, :text
      add :id_token, :text
      add :client_id, references(:clients, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:auth_data, [:client_id])
  end
end
