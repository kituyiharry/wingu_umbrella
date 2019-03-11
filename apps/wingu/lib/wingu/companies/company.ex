defmodule Wingu.Companies.Company do
  @moduledoc ~S"""
  #######################################################################
  #                           Company Struct                            #
  #######################################################################
  
  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  Company struct containing information about institution in use
  """
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "companies" do
    field :email, :string
    field :name, :string
    has_many :companies_clients, Wingu.Companies.Clients, on_delete: :delete_all
    has_many :clients, through: [:companies_clients, :clients]
    has_many :events, Wingu.Events.Event, on_delete: :delete_all
    has_many :stations, Wingu.Stations.Station, on_delete: :delete_all
    has_many :forms, Wingu.Forms.Form, foreign_key: :companies_id, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
    |> validate_length(:name, min: 1, max: 63)
    |> unique_constraint(:email)
  end
end
