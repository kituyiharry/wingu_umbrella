defmodule Wingu.Companies.Clients do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "companies_clients" do
    field :description, :string
    field :role, :string
    field :companies_id, :binary_id
    field :clients_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(clients, attrs) do
    clients
    |> cast(attrs, [:role, :description])
    |> validate_required([:role, :description])
  end
end
