defmodule Wingu.Clients.Client do
  @moduledoc ~S"""
  #######################################################################
  #                            Client Module                            #
  #######################################################################
  
  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  Client Struct containing a schema for a single client which contains various user
  metadata. Some information obtained via openid using Google auth
  """
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "clients" do
    field :email, :string
    field :firstname, :string
    field :surname, :string
    field :email_verified, :boolean, default: false
    field :picture, :string
    has_many :companies_clients, Wingu.Companies.Clients, on_delete: :delete_all
    has_many :companies, through: [:companies_clients, :companies]
    has_many :form_data, Wingu.FormData.FormDatum, foreign_key: :clients_id
    many_to_many :stations, Wingu.Stations.Station,  join_through: "stations_clients", join_keys: [stations_id: :id, clients_id: :id]

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:firstname, :surname, :email, :picture, :email_verified])
    |> validate_required([:firstname, :surname, :email, :email_verified, :picture])
    |> validate_length(:firstname, min: 1)
    |> validate_length(:surname, min: 1)
    |> unique_constraint(:email)
  end
end
