defmodule WinguWeb.SectionNodeController do
  use WinguWeb, :controller

  alias Wingu.SectionNodes
  alias Wingu.SectionNodes.SectionNode

  action_fallback WinguWeb.FallbackController

  def index(conn, _params) do
    section_nodes = SectionNodes.list_section_nodes()
    render(conn, "index.json", section_nodes: section_nodes)
  end

  def create(conn, %{"section_node" => section_node_params}) do
    with {:ok, %SectionNode{} = section_node} <- SectionNodes.create_section_node(section_node_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.section_node_path(conn, :show, section_node))
      |> render("show.json", section_node: section_node)
    end
  end

  def show(conn, %{"id" => id}) do
    section_node = SectionNodes.get_section_node!(id)
    render(conn, "show.json", section_node: section_node)
  end

  def update(conn, %{"id" => id, "section_node" => section_node_params}) do
    section_node = SectionNodes.get_section_node!(id)

    with {:ok, %SectionNode{} = section_node} <- SectionNodes.update_section_node(section_node, section_node_params) do
      render(conn, "show.json", section_node: section_node)
    end
  end

  def delete(conn, %{"id" => id}) do
    section_node = SectionNodes.get_section_node!(id)

    with {:ok, %SectionNode{}} <- SectionNodes.delete_section_node(section_node) do
      send_resp(conn, :no_content, "")
    end
  end
end
