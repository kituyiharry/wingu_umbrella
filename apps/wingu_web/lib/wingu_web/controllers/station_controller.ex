defmodule WinguWeb.StationController do
  use WinguWeb, :controller

  alias Wingu.Stations
  alias Wingu.Stations.Station

  action_fallback WinguWeb.FallbackController

  def index(conn, _params) do
    stations = Stations.list_stations()
    render(conn, "index.json", stations: stations)
  end

  def create(conn, %{"station" => station_params}) do
    with {:ok, %Station{} = station} <- Stations.create_station(station_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.station_path(conn, :show, station))
      |> render("show.json", station: station)
    end
  end

  def show(conn, %{"id" => id}) do
    station = Stations.get_station!(id)
    render(conn, "show.json", station: station)
  end

  def update(conn, %{"id" => id, "station" => station_params}) do
    station = Stations.get_station!(id)

    with {:ok, %Station{} = station} <- Stations.update_station(station, station_params) do
      render(conn, "show.json", station: station)
    end
  end

  def delete(conn, %{"id" => id}) do
    station = Stations.get_station!(id)

    with {:ok, %Station{}} <- Stations.delete_station(station) do
      send_resp(conn, :no_content, "")
    end
  end
end
