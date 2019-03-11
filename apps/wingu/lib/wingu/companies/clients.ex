defmodule Wingu.Companies.Clients do
  @moduledoc ~S"""
  #######################################################################
  #                      Companies & Clients Join                       #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  Join table between Companies and Clients allowing for many_to_many associations
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "companies_clients" do
    field :description, :string
    field :role, :string

    # Switched from many_to_many to a hacked up has_many<->belongs_to<->has_many, aliased some inflected fields
    field :company_id, :binary_id, source: :companies_id
    field :client_id, :binary_id, source: :clients_id
    # field :companies_id, :binary_id
    # field :clients_id, :binary_id
    belongs_to :companies, Wingu.Companies.Company
    belongs_to :clients, Wingu.Clients.Client
    # field :clients_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(clients, attrs) do
    clients
    |> cast(attrs, [:role, :description, :companies_id, :clients_id])
    |> validate_required([:role, :description, :companies_id, :clients_id])
    |> foreign_key_constraint(:companies_id)
    |> foreign_key_constraint(:clients_id)
    |> unique_constraint(:companies_id)
    |> unique_constraint(:clients_id)
  end
end
