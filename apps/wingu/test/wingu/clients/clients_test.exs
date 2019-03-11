defmodule Wingu.ClientsTest do
  use Wingu.DataCase

  alias Wingu.Clients

  describe "clients" do
    alias Wingu.Clients.Client

    @valid_attrs %{
      email: "email@server.domain",
      firstname: "some firstname",
      surname: "some surname",
      picture: "endpoint@server.com/resource.png"
    }
    @update_attrs %{
      email: "email@other.domain",
      firstname: "some updated firstname",
      surname: "some updated surname",
      picture: "endpoint.server.com/nres.jpg"
    }
    @invalid_attrs %{email: nil, firstname: nil, surname: nil, picture: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clients.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Clients.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Clients.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Clients.create_client(@valid_attrs)
      assert client.email == "email@server.domain"
      assert client.firstname == "some firstname"
      assert client.surname == "some surname"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clients.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, %Client{} = client} = Clients.update_client(client, @update_attrs)
      assert client.email == "email@other.domain"
      assert client.firstname == "some updated firstname"
      assert client.surname == "some updated surname"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Clients.update_client(client, @invalid_attrs)
      assert client == Clients.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Clients.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Clients.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Clients.change_client(client)
    end
  end
end
