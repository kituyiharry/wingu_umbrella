defmodule Wingu.Repo.Migrations.FormDocumentClass do
  use Ecto.Migration

  def change do
    alter table(:forms) do
      add :formclass,   :string
      add :customname, :string
    end
  end
end
