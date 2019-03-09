defmodule WinguWeb.FormControllerTest do
  use WinguWeb.ConnCase

  alias Wingu.Forms
  alias Wingu.Forms.Form

  @create_attrs %{
    description: "some description",
    name: "some name",
    summary: "some summary"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    summary: "some updated summary"
  }
  @invalid_attrs %{description: nil, name: nil, summary: nil}

  def fixture(:form) do
    {:ok, form} = Forms.create_form(@create_attrs)
    form
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all forms", %{conn: conn} do
      conn = get(conn, Routes.form_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create form" do
    test "renders form when data is valid", %{conn: conn} do
      conn = post(conn, Routes.form_path(conn, :create), form: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.form_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name",
               "summary" => "some summary"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.form_path(conn, :create), form: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update form" do
    setup [:create_form]

    test "renders form when data is valid", %{conn: conn, form: %Form{id: id} = form} do
      conn = put(conn, Routes.form_path(conn, :update, form), form: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.form_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name",
               "summary" => "some updated summary"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, form: form} do
      conn = put(conn, Routes.form_path(conn, :update, form), form: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete form" do
    setup [:create_form]

    test "deletes chosen form", %{conn: conn, form: form} do
      conn = delete(conn, Routes.form_path(conn, :delete, form))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.form_path(conn, :show, form))
      end
    end
  end

  defp create_form(_) do
    form = fixture(:form)
    {:ok, form: form}
  end
end
