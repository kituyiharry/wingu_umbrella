defmodule WinguWeb.GoogleAuthController do
  use WinguWeb, :controller
  plug Ueberauth

  require IO

  def callback(conn, params) do
    IO.inspect {:callback, conn}
    IO.inspect {:params, params}
    conn |> redirect(to: WinguWeb.Router.Helpers.page_path(conn, :index))
  end
end
