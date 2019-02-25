defmodule Wingu.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wingu.Companies.Company

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "events" do
    field :description, :string
    field :title, :string
    field :company_id, :binary_id
    belongs_to :companies, Company, [define_field: false, foreign_key: :company_id]

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
