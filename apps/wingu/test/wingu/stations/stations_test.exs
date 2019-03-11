defmodule Wingu.StationsTest do
  use Wingu.DataCase

  alias Wingu.Stations

  describe "stations" do
    alias Wingu.Stations.Station

    @valid_attrs %{meta: "some meta", name: "some name"}
    @update_attrs %{meta: "some updated meta", name: "some updated name"}
    @invalid_attrs %{meta: nil, name: nil}

    def station_fixture(attrs \\ %{}) do
      {:ok, station} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stations.create_station()

      station
    end

    test "list_stations/0 returns all stations" do
      station = station_fixture()
      assert Stations.list_stations() == [station]
    end

    test "get_station!/1 returns the station with given id" do
      station = station_fixture()
      assert Stations.get_station!(station.id) == station
    end

    test "create_station/1 with valid data creates a station" do
      assert {:ok, %Station{} = station} = Stations.create_station(@valid_attrs)
      assert station.meta == "some meta"
      assert station.name == "some name"
    end

    test "create_station/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stations.create_station(@invalid_attrs)
    end

    test "update_station/2 with valid data updates the station" do
      station = station_fixture()
      assert {:ok, %Station{} = station} = Stations.update_station(station, @update_attrs)
      assert station.meta == "some updated meta"
      assert station.name == "some updated name"
    end

    test "update_station/2 with invalid data returns error changeset" do
      station = station_fixture()
      assert {:error, %Ecto.Changeset{}} = Stations.update_station(station, @invalid_attrs)
      assert station == Stations.get_station!(station.id)
    end

    test "delete_station/1 deletes the station" do
      station = station_fixture()
      assert {:ok, %Station{}} = Stations.delete_station(station)
      assert_raise Ecto.NoResultsError, fn -> Stations.get_station!(station.id) end
    end

    test "change_station/1 returns a station changeset" do
      station = station_fixture()
      assert %Ecto.Changeset{} = Stations.change_station(station)
    end
  end
end
