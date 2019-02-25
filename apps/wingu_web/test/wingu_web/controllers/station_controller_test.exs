defmodule WinguWeb.StationControllerTest do
  use WinguWeb.ConnCase

  alias Wingu.Stations
  alias Wingu.Stations.Station

  @create_attrs %{
    meta: "some meta",
    name: "some name"
  }
  @update_attrs %{
    meta: "some updated meta",
    name: "some updated name"
  }
  @invalid_attrs %{meta: nil, name: nil}

  def fixture(:station) do
    {:ok, station} = Stations.create_station(@create_attrs)
    station
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stations", %{conn: conn} do
      conn = get(conn, Routes.station_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create station" do
    test "renders station when data is valid", %{conn: conn} do
      conn = post(conn, Routes.station_path(conn, :create), station: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.station_path(conn, :show, id))

      assert %{
               "id" => id,
               "meta" => "some meta",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.station_path(conn, :create), station: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update station" do
    setup [:create_station]

    test "renders station when data is valid", %{conn: conn, station: %Station{id: id} = station} do
      conn = put(conn, Routes.station_path(conn, :update, station), station: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.station_path(conn, :show, id))

      assert %{
               "id" => id,
               "meta" => "some updated meta",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, station: station} do
      conn = put(conn, Routes.station_path(conn, :update, station), station: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete station" do
    setup [:create_station]

    test "deletes chosen station", %{conn: conn, station: station} do
      conn = delete(conn, Routes.station_path(conn, :delete, station))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.station_path(conn, :show, station))
      end
    end
  end

  defp create_station(_) do
    station = fixture(:station)
    {:ok, station: station}
  end
end
