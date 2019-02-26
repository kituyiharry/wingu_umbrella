defmodule Wingu.Repo.Migrations.AddAuthSupport do
  use Ecto.Migration

  def change do
    alter table(:clients) do    
      add :email_verified, :boolean, default: :false
      add :picture, :string
    end
    alter table(:auth_data) do
      add :provider, :string
    end
  end
end
