defmodule Wingu.Repo.Migrations.CreateTextNodeData do
  use Ecto.Migration

  def change do
    create table(:text_node_data, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :node_value, :text
      add :description_nodes_id, references(:description_nodes, on_delete: :nothing, type: :binary_id)
      add :section_data_id, references(:section_data, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:text_node_data, [:description_nodes_id])
    create index(:text_node_data, [:section_data_id])
  end
end
