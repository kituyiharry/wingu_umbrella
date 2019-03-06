defmodule WinguWeb.DescriptionNodeController do
  use WinguWeb, :controller

  alias Wingu.DescriptionNodes
  alias Wingu.DescriptionNodes.DescriptionNode

  action_fallback WinguWeb.FallbackController

  def index(conn, _params) do
    description_nodes = DescriptionNodes.list_description_nodes()
    render(conn, "index.json", description_nodes: description_nodes)
  end

  def create(conn, %{"description_node" => description_node_params}) do
    with {:ok, %DescriptionNode{} = description_node} <- DescriptionNodes.create_description_node(description_node_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.description_node_path(conn, :show, description_node))
      |> render("show.json", description_node: description_node)
    end
  end

  def show(conn, %{"id" => id}) do
    description_node = DescriptionNodes.get_description_node!(id)
    render(conn, "show.json", description_node: description_node)
  end

  def update(conn, %{"id" => id, "description_node" => description_node_params}) do
    description_node = DescriptionNodes.get_description_node!(id)

    with {:ok, %DescriptionNode{} = description_node} <- DescriptionNodes.update_description_node(description_node, description_node_params) do
      render(conn, "show.json", description_node: description_node)
    end
  end

  def delete(conn, %{"id" => id}) do
    description_node = DescriptionNodes.get_description_node!(id)

    with {:ok, %DescriptionNode{}} <- DescriptionNodes.delete_description_node(description_node) do
      send_resp(conn, :no_content, "")
    end
  end
end
