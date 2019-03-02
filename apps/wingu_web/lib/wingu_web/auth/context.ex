defmodule WinguWeb.Context do
  @behaviour Plug

  import Plug.Conn
  alias WinguWeb.SessionController
  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  def build_context(conn) do
    case SessionController.authorize(conn) do
      {:ok, access}->
        access
      {:error, e} -> 
        e
    end
  end

end
