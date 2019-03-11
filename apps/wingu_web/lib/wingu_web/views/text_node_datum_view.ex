defmodule WinguWeb.TextNodeDatumView do
  use WinguWeb, :view
  alias WinguWeb.TextNodeDatumView

  def render("index.json", %{text_node_data: text_node_data}) do
    %{data: render_many(text_node_data, TextNodeDatumView, "text_node_datum.json")}
  end

  def render("show.json", %{text_node_datum: text_node_datum}) do
    %{data: render_one(text_node_datum, TextNodeDatumView, "text_node_datum.json")}
  end

  def render("text_node_datum.json", %{text_node_datum: text_node_datum}) do
    %{id: text_node_datum.id, node_value: text_node_datum.node_value}
  end
end
