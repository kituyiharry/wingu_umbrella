defmodule Wingu.Repo.Migrations.SectionNodeSummary do
  use Ecto.Migration

  def change do
    alter table(:section_nodes) do
      add :summary, :string
    end
  end
end
