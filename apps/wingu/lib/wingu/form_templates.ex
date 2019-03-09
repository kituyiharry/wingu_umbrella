defmodule Wingu.FormTemplates do
  @moduledoc """
  The FormTemplates context.
  """

  import Ecto.Query, warn: false
  alias Wingu.Repo

  alias Wingu.FormTemplates.FormTemplate

  @doc """
  Returns the list of form_templates.

  ## Examples

      iex> list_form_templates()
      [%FormTemplate{}, ...]

  """
  def list_form_templates do
    Repo.all(FormTemplate)
  end

  @doc """
  Gets a single form_template.

  Raises `Ecto.NoResultsError` if the Form template does not exist.

  ## Examples

      iex> get_form_template!(123)
      %FormTemplate{}

      iex> get_form_template!(456)
      ** (Ecto.NoResultsError)

  """
  def get_form_template!(id), do: Repo.get!(FormTemplate, id)

  @doc """
  Creates a form_template.

  ## Examples

      iex> create_form_template(%{field: value})
      {:ok, %FormTemplate{}}

      iex> create_form_template(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_form_template(attrs \\ %{}) do
    %FormTemplate{}
    |> FormTemplate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a form_template.

  ## Examples

      iex> update_form_template(form_template, %{field: new_value})
      {:ok, %FormTemplate{}}

      iex> update_form_template(form_template, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_form_template(%FormTemplate{} = form_template, attrs) do
    form_template
    |> FormTemplate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FormTemplate.

  ## Examples

      iex> delete_form_template(form_template)
      {:ok, %FormTemplate{}}

      iex> delete_form_template(form_template)
      {:error, %Ecto.Changeset{}}

  """
  def delete_form_template(%FormTemplate{} = form_template) do
    Repo.delete(form_template)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking form_template changes.

  ## Examples

      iex> change_form_template(form_template)
      %Ecto.Changeset{source: %FormTemplate{}}

  """
  def change_form_template(%FormTemplate{} = form_template) do
    FormTemplate.changeset(form_template, %{})
  end
end
