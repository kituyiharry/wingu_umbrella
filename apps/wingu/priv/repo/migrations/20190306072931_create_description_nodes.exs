defmodule Wingu.Repo.Migrations.CreateDescriptionNodes do
  use Ecto.Migration

  def change do
    create table(:description_nodes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :label, :string
      add :placeholder, :string
      add :isrequired, :boolean, default: false, null: false
      add :section_nodes_id, references(:section_nodes, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:description_nodes, [:section_nodes_id])
  end
end
