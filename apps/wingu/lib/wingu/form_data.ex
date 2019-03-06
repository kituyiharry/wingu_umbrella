defmodule Wingu.FormData do
  @moduledoc """
  The FormData context.
  """

  import Ecto.Query, warn: false
  alias Wingu.Repo

  alias Wingu.FormData.FormDatum

  @doc """
  Returns the list of form_data.

  ## Examples

      iex> list_form_data()
      [%FormDatum{}, ...]

  """
  def list_form_data do
    Repo.all(FormDatum)
  end

  @doc """
  Gets a single form_datum.

  Raises `Ecto.NoResultsError` if the Form datum does not exist.

  ## Examples

      iex> get_form_datum!(123)
      %FormDatum{}

      iex> get_form_datum!(456)
      ** (Ecto.NoResultsError)

  """
  def get_form_datum!(id), do: Repo.get!(FormDatum, id)

  @doc """
  Creates a form_datum.

  ## Examples

      iex> create_form_datum(%{field: value})
      {:ok, %FormDatum{}}

      iex> create_form_datum(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_form_datum(attrs \\ %{}) do
    %FormDatum{}
    |> FormDatum.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a form_datum.

  ## Examples

      iex> update_form_datum(form_datum, %{field: new_value})
      {:ok, %FormDatum{}}

      iex> update_form_datum(form_datum, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_form_datum(%FormDatum{} = form_datum, attrs) do
    form_datum
    |> FormDatum.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FormDatum.

  ## Examples

      iex> delete_form_datum(form_datum)
      {:ok, %FormDatum{}}

      iex> delete_form_datum(form_datum)
      {:error, %Ecto.Changeset{}}

  """
  def delete_form_datum(%FormDatum{} = form_datum) do
    Repo.delete(form_datum)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking form_datum changes.

  ## Examples

      iex> change_form_datum(form_datum)
      %Ecto.Changeset{source: %FormDatum{}}

  """
  def change_form_datum(%FormDatum{} = form_datum) do
    FormDatum.changeset(form_datum, %{})
  end
end
