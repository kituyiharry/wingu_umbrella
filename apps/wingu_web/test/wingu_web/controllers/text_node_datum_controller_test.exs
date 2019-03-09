defmodule WinguWeb.TextNodeDatumControllerTest do
  use WinguWeb.ConnCase

  alias Wingu.TextNodeData
  alias Wingu.TextNodeData.TextNodeDatum

  @create_attrs %{
    node_value: "some node_value"
  }
  @update_attrs %{
    node_value: "some updated node_value"
  }
  @invalid_attrs %{node_value: nil}

  def fixture(:text_node_datum) do
    {:ok, text_node_datum} = TextNodeData.create_text_node_datum(@create_attrs)
    text_node_datum
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all text_node_data", %{conn: conn} do
      conn = get(conn, Routes.text_node_datum_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create text_node_datum" do
    test "renders text_node_datum when data is valid", %{conn: conn} do
      conn = post(conn, Routes.text_node_datum_path(conn, :create), text_node_datum: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.text_node_datum_path(conn, :show, id))

      assert %{
               "id" => id,
               "node_value" => "some node_value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.text_node_datum_path(conn, :create), text_node_datum: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update text_node_datum" do
    setup [:create_text_node_datum]

    test "renders text_node_datum when data is valid", %{conn: conn, text_node_datum: %TextNodeDatum{id: id} = text_node_datum} do
      conn = put(conn, Routes.text_node_datum_path(conn, :update, text_node_datum), text_node_datum: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.text_node_datum_path(conn, :show, id))

      assert %{
               "id" => id,
               "node_value" => "some updated node_value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, text_node_datum: text_node_datum} do
      conn = put(conn, Routes.text_node_datum_path(conn, :update, text_node_datum), text_node_datum: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete text_node_datum" do
    setup [:create_text_node_datum]

    test "deletes chosen text_node_datum", %{conn: conn, text_node_datum: text_node_datum} do
      conn = delete(conn, Routes.text_node_datum_path(conn, :delete, text_node_datum))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.text_node_datum_path(conn, :show, text_node_datum))
      end
    end
  end

  defp create_text_node_datum(_) do
    text_node_datum = fixture(:text_node_datum)
    {:ok, text_node_datum: text_node_datum}
  end
end
