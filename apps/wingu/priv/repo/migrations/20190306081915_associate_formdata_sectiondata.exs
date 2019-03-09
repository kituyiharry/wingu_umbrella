defmodule Wingu.Repo.Migrations.AssociateFormdataSectiondata do
  use Ecto.Migration

  def change do
    alter table(:section_data) do
      add :form_data_id, references(:form_data, on_delete: :delete_all, type: :binary_id)
    end
  end
end
