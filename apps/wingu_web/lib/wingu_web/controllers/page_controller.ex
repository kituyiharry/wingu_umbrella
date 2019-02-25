defmodule WinguWeb.PageController do
  use WinguWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
