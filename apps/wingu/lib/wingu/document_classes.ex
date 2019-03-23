defmodule Wingu.DocumentClasses do
  @moduledoc """
  The DocumentClasses context.
  """

  import Ecto.Query, warn: false
  alias Wingu.Repo

  alias Wingu.DocumentClasses.DocumentClass

  @doc """
  Returns the list of document_class.

  ## Examples

      iex> list_document_class()
      [%DocumentClass{}, ...]

  """
  def list_document_class do
    Repo.all(DocumentClass)
  end

  @doc """
  Gets a single document_class.

  Raises `Ecto.NoResultsError` if the Document class does not exist.

  ## Examples

      iex> get_document_class!(123)
      %DocumentClass{}

      iex> get_document_class!(456)
      ** (Ecto.NoResultsError)

  """
  def get_document_class!(id), do: Repo.get!(DocumentClass, id)

  @doc """
  Creates a document_class.

  ## Examples

      iex> create_document_class(%{field: value})
      {:ok, %DocumentClass{}}

      iex> create_document_class(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_document_class(attrs \\ %{}) do
    %DocumentClass{}
    |> DocumentClass.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a document_class.

  ## Examples

      iex> update_document_class(document_class, %{field: new_value})
      {:ok, %DocumentClass{}}

      iex> update_document_class(document_class, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_document_class(%DocumentClass{} = document_class, attrs) do
    document_class
    |> DocumentClass.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DocumentClass.

  ## Examples

      iex> delete_document_class(document_class)
      {:ok, %DocumentClass{}}

      iex> delete_document_class(document_class)
      {:error, %Ecto.Changeset{}}

  """
  def delete_document_class(%DocumentClass{} = document_class) do
    Repo.delete(document_class)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking document_class changes.

  ## Examples

      iex> change_document_class(document_class)
      %Ecto.Changeset{source: %DocumentClass{}}

  """
  def change_document_class(%DocumentClass{} = document_class) do
    DocumentClass.changeset(document_class, %{})
  end
end
