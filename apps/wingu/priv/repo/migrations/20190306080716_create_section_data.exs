defmodule Wingu.Repo.Migrations.CreateSectionData do
  use Ecto.Migration

  def change do
    create table(:section_data, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :sections_nodes_id, references(:section_nodes, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:section_data, [:sections_nodes_id])
  end
end
