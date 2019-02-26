defmodule Wingu.Repo.Migrations.AddTimexSupport do
  use Ecto.Migration

  def change do
    alter table(:events) do       
      add :from, :utc_datetime
      add :to, :utc_datetime
    end
  end
end
