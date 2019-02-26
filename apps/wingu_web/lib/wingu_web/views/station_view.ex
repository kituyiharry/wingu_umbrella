defmodule WinguWeb.StationView do
  use WinguWeb, :view
  alias WinguWeb.StationView

  def render("index.json", %{stations: stations}) do
    %{data: render_many(stations, StationView, "station.json")}
  end

  def render("show.json", %{station: station}) do
    %{data: render_one(station, StationView, "station.json")}
  end

  def render("station.json", %{station: station}) do
    %{id: station.id,
      name: station.name,
      meta: station.meta}
  end
end
