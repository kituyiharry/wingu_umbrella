defmodule Wingu.Stations.Station do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "stations" do
    field :meta, :string
    field :name, :string
    field :company_id, :binary_id
    many_to_many :clients, Wingu.Clients.Client,  join_through: "stations_clients"

    timestamps()
  end

  @doc false
  def changeset(station, attrs) do
    station
    |> cast(attrs, [:name, :meta])
    |> validate_required([:name, :meta])
    |> validate_length(:name, min: 3, max: 140)
    |> validate_length(:meta, min: 3, max: 280)
  end
end
