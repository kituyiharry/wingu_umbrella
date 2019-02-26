defmodule WinguWeb.PageController do
  use WinguWeb, :controller
  alias WinguWeb.SessionController

  require IO
  def index(conn, _params) do
    tf = WinguWeb.Guardian.Plug.authenticated? conn
    IO.inspect(tf)
    case SessionController.authenticate(conn) do
      {:ok, %Wingu.Clients.Client{} = client, _claims} ->
        conn |> WinguWeb.Guardian.Plug.sign_in(client) |> put_flash(:info, "Signed in") |> render("index.html")
      _ ->
        conn |> put_flash(:error, "Couldn't authenticate") |> render("index.html")
    end
  end
end
