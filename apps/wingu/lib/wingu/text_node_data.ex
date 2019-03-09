defmodule Wingu.TextNodeData do
  @moduledoc """
  The TextNodeData context.
  """

  import Ecto.Query, warn: false
  alias Wingu.Repo

  alias Wingu.TextNodeData.TextNodeDatum

  @doc """
  Returns the list of text_node_data.

  ## Examples

      iex> list_text_node_data()
      [%TextNodeDatum{}, ...]

  """
  def list_text_node_data do
    Repo.all(TextNodeDatum)
  end

  @doc """
  Gets a single text_node_datum.

  Raises `Ecto.NoResultsError` if the Text node datum does not exist.

  ## Examples

      iex> get_text_node_datum!(123)
      %TextNodeDatum{}

      iex> get_text_node_datum!(456)
      ** (Ecto.NoResultsError)

  """
  def get_text_node_datum!(id), do: Repo.get!(TextNodeDatum, id)

  @doc """
  Creates a text_node_datum.

  ## Examples

      iex> create_text_node_datum(%{field: value})
      {:ok, %TextNodeDatum{}}

      iex> create_text_node_datum(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_text_node_datum(attrs \\ %{}) do
    %TextNodeDatum{}
    |> TextNodeDatum.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a text_node_datum.

  ## Examples

      iex> update_text_node_datum(text_node_datum, %{field: new_value})
      {:ok, %TextNodeDatum{}}

      iex> update_text_node_datum(text_node_datum, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_text_node_datum(%TextNodeDatum{} = text_node_datum, attrs) do
    text_node_datum
    |> TextNodeDatum.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TextNodeDatum.

  ## Examples

      iex> delete_text_node_datum(text_node_datum)
      {:ok, %TextNodeDatum{}}

      iex> delete_text_node_datum(text_node_datum)
      {:error, %Ecto.Changeset{}}

  """
  def delete_text_node_datum(%TextNodeDatum{} = text_node_datum) do
    Repo.delete(text_node_datum)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking text_node_datum changes.

  ## Examples

      iex> change_text_node_datum(text_node_datum)
      %Ecto.Changeset{source: %TextNodeDatum{}}

  """
  def change_text_node_datum(%TextNodeDatum{} = text_node_datum) do
    TextNodeDatum.changeset(text_node_datum, %{})
  end
end
