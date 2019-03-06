defmodule WinguWeb.DescriptionNodeView do
  use WinguWeb, :view
  alias WinguWeb.DescriptionNodeView

  def render("index.json", %{description_nodes: description_nodes}) do
    %{data: render_many(description_nodes, DescriptionNodeView, "description_node.json")}
  end

  def render("show.json", %{description_node: description_node}) do
    %{data: render_one(description_node, DescriptionNodeView, "description_node.json")}
  end

  def render("description_node.json", %{description_node: description_node}) do
    %{id: description_node.id,
      label: description_node.label,
      placeholder: description_node.placeholder,
      isrequired: description_node.isrequired}
  end
end
