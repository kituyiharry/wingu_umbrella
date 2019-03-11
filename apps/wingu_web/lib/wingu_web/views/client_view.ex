defmodule WinguWeb.ClientView do
  use WinguWeb, :view
  alias WinguWeb.ClientView

  def render("index.json", %{clients: clients}) do
    %{data: render_many(clients, ClientView, "client.json")}
  end

  def render("show.json", %{client: client}) do
    %{data: render_one(client, ClientView, "client.json")}
  end

  def render("client.json", %{client: client}) do
    %{id: client.id, firstname: client.firstname, surname: client.surname, email: client.email}
  end
end
