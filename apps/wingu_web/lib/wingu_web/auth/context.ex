defmodule WinguWeb.Context do
  @behaviour Plug

  import Plug.Conn
  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    put_private(conn, :absinthe, %{context: context})
  end

  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, current_user} <- authorize(token) do
      %{current_user: current_user}
    else
      _ -> %{}
    end
  end

  # NOTE: This is a stub, just returning the first user and stubbing in the user
  # as an administrator.
  defp authorize(_token) do
    Accounts.User
    |> first
    |> Repo.one
    |> case do
         nil -> {:error, "No users available, have you run the seeds?"}
         user -> {:ok, Map.put(user, :admin, true)}
       end
  end
  
end
