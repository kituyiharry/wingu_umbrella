defmodule Wingu.DescriptionNodes do
  @moduledoc """
  The DescriptionNodes context.
  """

  import Ecto.Query, warn: false
  alias Wingu.Repo

  alias Wingu.DescriptionNodes.DescriptionNode

  @doc """
  Returns the list of description_nodes.

  ## Examples

      iex> list_description_nodes()
      [%DescriptionNode{}, ...]

  """
  def list_description_nodes do
    Repo.all(DescriptionNode)
  end

  @doc """
  Gets a single description_node.

  Raises `Ecto.NoResultsError` if the Description node does not exist.

  ## Examples

      iex> get_description_node!(123)
      %DescriptionNode{}

      iex> get_description_node!(456)
      ** (Ecto.NoResultsError)

  """
  def get_description_node!(id), do: Repo.get!(DescriptionNode, id)

  @doc """
  Creates a description_node.

  ## Examples

      iex> create_description_node(%{field: value})
      {:ok, %DescriptionNode{}}

      iex> create_description_node(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_description_node(attrs \\ %{}) do
    %DescriptionNode{}
    |> DescriptionNode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a description_node.

  ## Examples

      iex> update_description_node(description_node, %{field: new_value})
      {:ok, %DescriptionNode{}}

      iex> update_description_node(description_node, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_description_node(%DescriptionNode{} = description_node, attrs) do
    description_node
    |> DescriptionNode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DescriptionNode.

  ## Examples

      iex> delete_description_node(description_node)
      {:ok, %DescriptionNode{}}

      iex> delete_description_node(description_node)
      {:error, %Ecto.Changeset{}}

  """
  def delete_description_node(%DescriptionNode{} = description_node) do
    Repo.delete(description_node)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking description_node changes.

  ## Examples

      iex> change_description_node(description_node)
      %Ecto.Changeset{source: %DescriptionNode{}}

  """
  def change_description_node(%DescriptionNode{} = description_node) do
    DescriptionNode.changeset(description_node, %{})
  end
end
