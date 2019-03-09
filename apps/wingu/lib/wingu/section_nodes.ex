defmodule Wingu.SectionNodes do
  @moduledoc """
  The SectionNodes context.
  """

  import Ecto.Query, warn: false
  alias Wingu.Repo

  alias Wingu.SectionNodes.SectionNode

  @doc """
  Returns the list of section_nodes.

  ## Examples

      iex> list_section_nodes()
      [%SectionNode{}, ...]

  """
  def list_section_nodes do
    Repo.all(SectionNode)
  end

  @doc """
  Gets a single section_node.

  Raises `Ecto.NoResultsError` if the Section node does not exist.

  ## Examples

      iex> get_section_node!(123)
      %SectionNode{}

      iex> get_section_node!(456)
      ** (Ecto.NoResultsError)

  """
  def get_section_node!(id), do: Repo.get!(SectionNode, id)

  @doc """
  Creates a section_node.

  ## Examples

      iex> create_section_node(%{field: value})
      {:ok, %SectionNode{}}

      iex> create_section_node(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_section_node(attrs \\ %{}) do
    %SectionNode{}
    |> SectionNode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a section_node.

  ## Examples

      iex> update_section_node(section_node, %{field: new_value})
      {:ok, %SectionNode{}}

      iex> update_section_node(section_node, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_section_node(%SectionNode{} = section_node, attrs) do
    section_node
    |> SectionNode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SectionNode.

  ## Examples

      iex> delete_section_node(section_node)
      {:ok, %SectionNode{}}

      iex> delete_section_node(section_node)
      {:error, %Ecto.Changeset{}}

  """
  def delete_section_node(%SectionNode{} = section_node) do
    Repo.delete(section_node)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking section_node changes.

  ## Examples

      iex> change_section_node(section_node)
      %Ecto.Changeset{source: %SectionNode{}}

  """
  def change_section_node(%SectionNode{} = section_node) do
    SectionNode.changeset(section_node, %{})
  end
end
