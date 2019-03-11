defmodule WinguWeb.GraphQL.Resolvers.ClientResolver do
  @moduledoc ~S"""
  #######################################################################
  #                           ClientResolver                            #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  A Resolver module for Client information requests
  """
  alias Wingu.{Repo, Clients}

  @doc "Returns information about the connected client from the absinthe context"
  def client(_parent, _args, %{context: %{"sub" => sub}}) do
    case Repo.get(Clients.Client, sub) do
      %Clients.Client{} = client ->
        {:ok, client}

      _ ->
        {:error, "Account not available"}
    end
  end

  @doc "Returns an error when the client is not signed in"
  def client(_parent, _args, %{context: %Guardian.MalformedReturnValueError{}}) do
    {:error, "Not Signed in"}
  end
end
