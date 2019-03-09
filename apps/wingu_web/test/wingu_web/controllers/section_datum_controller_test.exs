defmodule WinguWeb.SectionDatumControllerTest do
  use WinguWeb.ConnCase

  alias Wingu.SectionData
  alias Wingu.SectionData.SectionDatum

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:section_datum) do
    {:ok, section_datum} = SectionData.create_section_datum(@create_attrs)
    section_datum
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all section_data", %{conn: conn} do
      conn = get(conn, Routes.section_datum_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create section_datum" do
    test "renders section_datum when data is valid", %{conn: conn} do
      conn = post(conn, Routes.section_datum_path(conn, :create), section_datum: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.section_datum_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.section_datum_path(conn, :create), section_datum: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update section_datum" do
    setup [:create_section_datum]

    test "renders section_datum when data is valid", %{conn: conn, section_datum: %SectionDatum{id: id} = section_datum} do
      conn = put(conn, Routes.section_datum_path(conn, :update, section_datum), section_datum: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.section_datum_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, section_datum: section_datum} do
      conn = put(conn, Routes.section_datum_path(conn, :update, section_datum), section_datum: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete section_datum" do
    setup [:create_section_datum]

    test "deletes chosen section_datum", %{conn: conn, section_datum: section_datum} do
      conn = delete(conn, Routes.section_datum_path(conn, :delete, section_datum))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.section_datum_path(conn, :show, section_datum))
      end
    end
  end

  defp create_section_datum(_) do
    section_datum = fixture(:section_datum)
    {:ok, section_datum: section_datum}
  end
end
