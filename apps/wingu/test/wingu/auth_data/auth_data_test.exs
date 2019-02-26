defmodule Wingu.AuthDataTest do
  use Wingu.DataCase

  alias Wingu.AuthData

  describe "auth_data" do
    alias Wingu.AuthData.AuthDatum

    @valid_attrs %{access_token: "some access_token", id_token: "some id_token", token_type: "some token_type"}
    @update_attrs %{access_token: "some updated access_token", id_token: "some updated id_token", token_type: "some updated token_type"}
    @invalid_attrs %{access_token: nil, id_token: nil, token_type: nil}

    def auth_datum_fixture(attrs \\ %{}) do
      {:ok, auth_datum} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AuthData.create_auth_datum()

      auth_datum
    end

    test "list_auth_data/0 returns all auth_data" do
      auth_datum = auth_datum_fixture()
      assert AuthData.list_auth_data() == [auth_datum]
    end

    test "get_auth_datum!/1 returns the auth_datum with given id" do
      auth_datum = auth_datum_fixture()
      assert AuthData.get_auth_datum!(auth_datum.id) == auth_datum
    end

    test "create_auth_datum/1 with valid data creates a auth_datum" do
      assert {:ok, %AuthDatum{} = auth_datum} = AuthData.create_auth_datum(@valid_attrs)
      assert auth_datum.access_token == "some access_token"
      assert auth_datum.id_token == "some id_token"
      assert auth_datum.token_type == "some token_type"
    end

    test "create_auth_datum/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AuthData.create_auth_datum(@invalid_attrs)
    end

    test "update_auth_datum/2 with valid data updates the auth_datum" do
      auth_datum = auth_datum_fixture()
      assert {:ok, %AuthDatum{} = auth_datum} = AuthData.update_auth_datum(auth_datum, @update_attrs)
      assert auth_datum.access_token == "some updated access_token"
      assert auth_datum.id_token == "some updated id_token"
      assert auth_datum.token_type == "some updated token_type"
    end

    test "update_auth_datum/2 with invalid data returns error changeset" do
      auth_datum = auth_datum_fixture()
      assert {:error, %Ecto.Changeset{}} = AuthData.update_auth_datum(auth_datum, @invalid_attrs)
      assert auth_datum == AuthData.get_auth_datum!(auth_datum.id)
    end

    test "delete_auth_datum/1 deletes the auth_datum" do
      auth_datum = auth_datum_fixture()
      assert {:ok, %AuthDatum{}} = AuthData.delete_auth_datum(auth_datum)
      assert_raise Ecto.NoResultsError, fn -> AuthData.get_auth_datum!(auth_datum.id) end
    end

    test "change_auth_datum/1 returns a auth_datum changeset" do
      auth_datum = auth_datum_fixture()
      assert %Ecto.Changeset{} = AuthData.change_auth_datum(auth_datum)
    end
  end
end
