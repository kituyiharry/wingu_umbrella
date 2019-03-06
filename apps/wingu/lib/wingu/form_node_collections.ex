defmodule Wingu.FormNodeCollections do
  @moduledoc """
  The FormNodeCollections context.
  """

  import Ecto.Query, warn: false
  alias Wingu.Repo

  alias Wingu.FormNodeCollections.FormNodeCollection

  @doc """
  Returns the list of form_node_collections.

  ## Examples

      iex> list_form_node_collections()
      [%FormNodeCollection{}, ...]

  """
  def list_form_node_collections do
    Repo.all(FormNodeCollection)
  end

  @doc """
  Gets a single form_node_collection.

  Raises `Ecto.NoResultsError` if the Form node collection does not exist.

  ## Examples

      iex> get_form_node_collection!(123)
      %FormNodeCollection{}

      iex> get_form_node_collection!(456)
      ** (Ecto.NoResultsError)

  """
  def get_form_node_collection!(id), do: Repo.get!(FormNodeCollection, id)

  @doc """
  Creates a form_node_collection.

  ## Examples

      iex> create_form_node_collection(%{field: value})
      {:ok, %FormNodeCollection{}}

      iex> create_form_node_collection(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_form_node_collection(attrs \\ %{}) do
    %FormNodeCollection{}
    |> FormNodeCollection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a form_node_collection.

  ## Examples

      iex> update_form_node_collection(form_node_collection, %{field: new_value})
      {:ok, %FormNodeCollection{}}

      iex> update_form_node_collection(form_node_collection, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_form_node_collection(%FormNodeCollection{} = form_node_collection, attrs) do
    form_node_collection
    |> FormNodeCollection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FormNodeCollection.

  ## Examples

      iex> delete_form_node_collection(form_node_collection)
      {:ok, %FormNodeCollection{}}

      iex> delete_form_node_collection(form_node_collection)
      {:error, %Ecto.Changeset{}}

  """
  def delete_form_node_collection(%FormNodeCollection{} = form_node_collection) do
    Repo.delete(form_node_collection)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking form_node_collection changes.

  ## Examples

      iex> change_form_node_collection(form_node_collection)
      %Ecto.Changeset{source: %FormNodeCollection{}}

  """
  def change_form_node_collection(%FormNodeCollection{} = form_node_collection) do
    FormNodeCollection.changeset(form_node_collection, %{})
  end
end
