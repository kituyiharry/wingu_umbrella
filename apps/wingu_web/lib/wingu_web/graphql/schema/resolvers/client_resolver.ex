defmodule WinguWeb.GraphQL.Resolvers.ClientResolver do 
  alias Wingu.{Repo, Clients}

  def client(_parent, _args, %{context: %{"sub" => sub}}) do
    case Repo.get(Clients.Client,sub) do
      %Clients.Client{} = client ->
        {:ok, client}
      _ ->
        {:error, "Account not available"}
    end
  end

  def client(_parent, _args, %{context: %Guardian.MalformedReturnValueError{}}) do
    {:error, "Not Signed in"}
  end
end
