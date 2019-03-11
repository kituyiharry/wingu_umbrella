defmodule WinguWeb.GraphQL.TransactionHelper do
  @moduledoc ~S"""
  Helper functions for various repetitive patterns, DRY!
  """
  alias WinguWeb.GraphQL.Helpers
  alias Wingu.Repo

  @doc "Fetches a model inside a multi using repo and id"
  def handle_fetch(repo, module, id) do
    case repo.get(module, id) do
      %^module{} = model ->
        {:ok, model}
      nil -> 
        {:error, "A struct couldn't be found"}
      _ ->
        {:error, "Unknown error"}
    end
  end

  @doc "Performs an ecto transaction for a multi"
  def handle_transaction(multi, key) do
    case Repo.transaction(multi) do
      {:ok, match} ->
        {:ok, Map.get(match, key)}
      {:error, _key, change, _ops} ->
        {:error, Helpers.translate_error(change)}
      _ ->
        {:error, "Unknown operation"}
    end
  end
end
