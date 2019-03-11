defmodule WinguWeb.SessionController do
  use WinguWeb, :controller

  def authenticate(%Plug.Conn{} = conn) do
    conn
    |> get_session("guardian_default_token")
    |> WinguWeb.Guardian.resource_from_token()
  end

  def authorize(%Plug.Conn{} = conn) do
    conn
    |> get_session("guardian_default_token")
    |> WinguWeb.Guardian.decode_and_verify()
  end
end
