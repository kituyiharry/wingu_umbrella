defmodule WinguWeb.TextNodeDatumController do
  use WinguWeb, :controller

  alias Wingu.TextNodeData
  alias Wingu.TextNodeData.TextNodeDatum

  action_fallback WinguWeb.FallbackController

  def index(conn, _params) do
    text_node_data = TextNodeData.list_text_node_data()
    render(conn, "index.json", text_node_data: text_node_data)
  end

  def create(conn, %{"text_node_datum" => text_node_datum_params}) do
    with {:ok, %TextNodeDatum{} = text_node_datum} <- TextNodeData.create_text_node_datum(text_node_datum_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.text_node_datum_path(conn, :show, text_node_datum))
      |> render("show.json", text_node_datum: text_node_datum)
    end
  end

  def show(conn, %{"id" => id}) do
    text_node_datum = TextNodeData.get_text_node_datum!(id)
    render(conn, "show.json", text_node_datum: text_node_datum)
  end

  def update(conn, %{"id" => id, "text_node_datum" => text_node_datum_params}) do
    text_node_datum = TextNodeData.get_text_node_datum!(id)

    with {:ok, %TextNodeDatum{} = text_node_datum} <- TextNodeData.update_text_node_datum(text_node_datum, text_node_datum_params) do
      render(conn, "show.json", text_node_datum: text_node_datum)
    end
  end

  def delete(conn, %{"id" => id}) do
    text_node_datum = TextNodeData.get_text_node_datum!(id)

    with {:ok, %TextNodeDatum{}} <- TextNodeData.delete_text_node_datum(text_node_datum) do
      send_resp(conn, :no_content, "")
    end
  end
end
