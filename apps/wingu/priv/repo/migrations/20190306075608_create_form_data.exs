defmodule Wingu.Repo.Migrations.CreateFormData do
  use Ecto.Migration

  def change do
    create table(:form_data, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :forms_id, references(:forms, on_delete: :delete_all, type: :binary_id)
      add :clients_id, references(:clients, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:form_data, [:forms_id])
    create index(:form_data, [:clients_id])
  end
end
