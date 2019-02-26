defmodule WinguWeb.Context do
  @behaviour Plug

  import Plug.Conn
  alias WinguWeb.SessionController
  def init(opts), do: opts

  def call(conn, _) do
  end

  def build_context(conn) do
  end

  # NOTE: This is a stub, just returning the first user and stubbing in the user
  # as an administrator.
  defp authorize(_token) do
  end
  
end
