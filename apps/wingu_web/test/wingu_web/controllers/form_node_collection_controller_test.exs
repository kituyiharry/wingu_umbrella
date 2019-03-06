defmodule WinguWeb.FormNodeCollectionControllerTest do
  use WinguWeb.ConnCase

  alias Wingu.FormNodeCollections
  alias Wingu.FormNodeCollections.FormNodeCollection

  @create_attrs %{
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:form_node_collection) do
    {:ok, form_node_collection} = FormNodeCollections.create_form_node_collection(@create_attrs)
    form_node_collection
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all form_node_collections", %{conn: conn} do
      conn = get(conn, Routes.form_node_collection_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create form_node_collection" do
    test "renders form_node_collection when data is valid", %{conn: conn} do
      conn = post(conn, Routes.form_node_collection_path(conn, :create), form_node_collection: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.form_node_collection_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.form_node_collection_path(conn, :create), form_node_collection: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update form_node_collection" do
    setup [:create_form_node_collection]

    test "renders form_node_collection when data is valid", %{conn: conn, form_node_collection: %FormNodeCollection{id: id} = form_node_collection} do
      conn = put(conn, Routes.form_node_collection_path(conn, :update, form_node_collection), form_node_collection: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.form_node_collection_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, form_node_collection: form_node_collection} do
      conn = put(conn, Routes.form_node_collection_path(conn, :update, form_node_collection), form_node_collection: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete form_node_collection" do
    setup [:create_form_node_collection]

    test "deletes chosen form_node_collection", %{conn: conn, form_node_collection: form_node_collection} do
      conn = delete(conn, Routes.form_node_collection_path(conn, :delete, form_node_collection))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.form_node_collection_path(conn, :show, form_node_collection))
      end
    end
  end

  defp create_form_node_collection(_) do
    form_node_collection = fixture(:form_node_collection)
    {:ok, form_node_collection: form_node_collection}
  end
end
