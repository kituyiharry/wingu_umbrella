defmodule Wingu.Events.Event do
  @moduledoc ~S"""
  #######################################################################
  #                            Event struct                             #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  a struct for information about events created under a company
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Wingu.Companies.Company

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "events" do
    field :description, :string
    field :title, :string
    field :company_id, :binary_id
    field :from, :utc_datetime
    field :to, :utc_datetime
    belongs_to :companies, Company, define_field: false, foreign_key: :company_id

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :from, :to])
    |> validate_required([:title, :description, :from, :to])
    |> validate_length(:title, min: 3, max: 63)
    |> validate_length(:description, min: 3, max: 280)
  end
end
