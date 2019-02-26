defmodule Wingu.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "clients" do
    field :email, :string
    field :firstname, :string
    field :surname, :string
    many_to_many :companies, Wingu.Companies.Company,  join_through: "companies_clients"
    many_to_many :stations, Wingu.Stations.Station,  join_through: "stations_clients"

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:firstname, :surname, :email])
    |> validate_required([:firstname, :surname, :email])
    |> unique_constraint(:email)
  end
end
