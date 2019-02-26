defmodule Wingu.AuthData do
  @moduledoc """
  The AuthData context.
  """

  import Ecto.Query, warn: false
  alias Wingu.Repo

  alias Wingu.AuthData.AuthDatum

  @doc """
  Returns the list of auth_data.

  ## Examples

      iex> list_auth_data()
      [%AuthDatum{}, ...]

  """
  def list_auth_data do
    Repo.all(AuthDatum)
  end

  @doc """
  Gets a single auth_datum.

  Raises `Ecto.NoResultsError` if the Auth datum does not exist.

  ## Examples

      iex> get_auth_datum!(123)
      %AuthDatum{}

      iex> get_auth_datum!(456)
      ** (Ecto.NoResultsError)

  """
  def get_auth_datum!(id), do: Repo.get!(AuthDatum, id)

  @doc """
  Creates a auth_datum.

  ## Examples

      iex> create_auth_datum(%{field: value})
      {:ok, %AuthDatum{}}

      iex> create_auth_datum(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_auth_datum(attrs \\ %{}) do
    %AuthDatum{}
    |> AuthDatum.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a auth_datum.

  ## Examples

      iex> update_auth_datum(auth_datum, %{field: new_value})
      {:ok, %AuthDatum{}}

      iex> update_auth_datum(auth_datum, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_auth_datum(%AuthDatum{} = auth_datum, attrs) do
    auth_datum
    |> AuthDatum.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AuthDatum.

  ## Examples

      iex> delete_auth_datum(auth_datum)
      {:ok, %AuthDatum{}}

      iex> delete_auth_datum(auth_datum)
      {:error, %Ecto.Changeset{}}

  """
  def delete_auth_datum(%AuthDatum{} = auth_datum) do
    Repo.delete(auth_datum)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking auth_datum changes.

  ## Examples

      iex> change_auth_datum(auth_datum)
      %Ecto.Changeset{source: %AuthDatum{}}

  """
  def change_auth_datum(%AuthDatum{} = auth_datum) do
    AuthDatum.changeset(auth_datum, %{})
  end
end
