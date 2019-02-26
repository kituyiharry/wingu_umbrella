defmodule Wingu.Stations.Clients do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "stations_clients" do
    field :stations_id, :binary_id
    field :clients_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(clients, attrs) do
    clients
    |> cast(attrs, [])
    |> validate_required([])
  end
end
