defmodule Wingu.AuthData.AuthDatum do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wingu.Clients.Client

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "auth_data" do
    field :access_token, :string
    field :id_token, :string
    field :token_type, :string
    field :client_id, :binary_id
    field :provider, :string
    belongs_to :clients, Client, [define_field: false, foreign_key: :client_id]

    timestamps()
  end

  @doc false
  def changeset(auth_datum, attrs) do
    auth_datum
    |> cast(attrs, [:token_type, :access_token, :id_token])
    |> validate_required([:token_type, :access_token, :id_token])
  end
end
