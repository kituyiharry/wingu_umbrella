defmodule WinguWeb.PageController do
  use WinguWeb, :controller
  alias WinguWeb.SessionController

  require IO
  def index(conn, _params) do
    case SessionController.authenticate(conn) do
      {:ok, %Wingu.Clients.Client{} = client, _claims} ->
        token = get_session(conn,"guardian_default_token")
        conn |> WinguWeb.Guardian.Plug.sign_in(client) |> put_flash(:info, token) |> render("index.html")
      _ ->
        conn |> put_flash(:error, "Couldn't Sign in") |> render("index.html")
    end
  end
end
