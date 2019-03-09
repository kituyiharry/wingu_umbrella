defmodule Wingu.SectionData do
  @moduledoc """
  The SectionData context.
  """

  import Ecto.Query, warn: false
  alias Wingu.Repo

  alias Wingu.SectionData.SectionDatum

  @doc """
  Returns the list of section_data.

  ## Examples

      iex> list_section_data()
      [%SectionDatum{}, ...]

  """
  def list_section_data do
    Repo.all(SectionDatum)
  end

  @doc """
  Gets a single section_datum.

  Raises `Ecto.NoResultsError` if the Section datum does not exist.

  ## Examples

      iex> get_section_datum!(123)
      %SectionDatum{}

      iex> get_section_datum!(456)
      ** (Ecto.NoResultsError)

  """
  def get_section_datum!(id), do: Repo.get!(SectionDatum, id)

  @doc """
  Creates a section_datum.

  ## Examples

      iex> create_section_datum(%{field: value})
      {:ok, %SectionDatum{}}

      iex> create_section_datum(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_section_datum(attrs \\ %{}) do
    %SectionDatum{}
    |> SectionDatum.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a section_datum.

  ## Examples

      iex> update_section_datum(section_datum, %{field: new_value})
      {:ok, %SectionDatum{}}

      iex> update_section_datum(section_datum, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_section_datum(%SectionDatum{} = section_datum, attrs) do
    section_datum
    |> SectionDatum.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SectionDatum.

  ## Examples

      iex> delete_section_datum(section_datum)
      {:ok, %SectionDatum{}}

      iex> delete_section_datum(section_datum)
      {:error, %Ecto.Changeset{}}

  """
  def delete_section_datum(%SectionDatum{} = section_datum) do
    Repo.delete(section_datum)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking section_datum changes.

  ## Examples

      iex> change_section_datum(section_datum)
      %Ecto.Changeset{source: %SectionDatum{}}

  """
  def change_section_datum(%SectionDatum{} = section_datum) do
    SectionDatum.changeset(section_datum, %{})
  end
end
