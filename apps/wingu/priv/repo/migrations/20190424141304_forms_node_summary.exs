defmodule Wingu.Repo.Migrations.FormsNodeSummary do
  use Ecto.Migration

  def change do
    alter table(:description_nodes) do
      add :summary, :string
    end
  end
end
