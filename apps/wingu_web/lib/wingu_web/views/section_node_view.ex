defmodule WinguWeb.SectionNodeView do
  use WinguWeb, :view
  alias WinguWeb.SectionNodeView

  def render("index.json", %{section_nodes: section_nodes}) do
    %{data: render_many(section_nodes, SectionNodeView, "section_node.json")}
  end

  def render("show.json", %{section_node: section_node}) do
    %{data: render_one(section_node, SectionNodeView, "section_node.json")}
  end

  def render("section_node.json", %{section_node: section_node}) do
    %{id: section_node.id,
      name: section_node.name,
      description: section_node.description}
  end
end
