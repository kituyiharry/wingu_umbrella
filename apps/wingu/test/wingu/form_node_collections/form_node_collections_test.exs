defmodule Wingu.FormNodeCollectionsTest do
  use Wingu.DataCase

  alias Wingu.FormNodeCollections

  describe "form_node_collections" do
    alias Wingu.FormNodeCollections.FormNodeCollection

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def form_node_collection_fixture(attrs \\ %{}) do
      {:ok, form_node_collection} =
        attrs
        |> Enum.into(@valid_attrs)
        |> FormNodeCollections.create_form_node_collection()

      form_node_collection
    end

    test "list_form_node_collections/0 returns all form_node_collections" do
      form_node_collection = form_node_collection_fixture()
      assert FormNodeCollections.list_form_node_collections() == [form_node_collection]
    end

    test "get_form_node_collection!/1 returns the form_node_collection with given id" do
      form_node_collection = form_node_collection_fixture()
      assert FormNodeCollections.get_form_node_collection!(form_node_collection.id) == form_node_collection
    end

    test "create_form_node_collection/1 with valid data creates a form_node_collection" do
      assert {:ok, %FormNodeCollection{} = form_node_collection} = FormNodeCollections.create_form_node_collection(@valid_attrs)
      assert form_node_collection.description == "some description"
      assert form_node_collection.name == "some name"
    end

    test "create_form_node_collection/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FormNodeCollections.create_form_node_collection(@invalid_attrs)
    end

    test "update_form_node_collection/2 with valid data updates the form_node_collection" do
      form_node_collection = form_node_collection_fixture()
      assert {:ok, %FormNodeCollection{} = form_node_collection} = FormNodeCollections.update_form_node_collection(form_node_collection, @update_attrs)
      assert form_node_collection.description == "some updated description"
      assert form_node_collection.name == "some updated name"
    end

    test "update_form_node_collection/2 with invalid data returns error changeset" do
      form_node_collection = form_node_collection_fixture()
      assert {:error, %Ecto.Changeset{}} = FormNodeCollections.update_form_node_collection(form_node_collection, @invalid_attrs)
      assert form_node_collection == FormNodeCollections.get_form_node_collection!(form_node_collection.id)
    end

    test "delete_form_node_collection/1 deletes the form_node_collection" do
      form_node_collection = form_node_collection_fixture()
      assert {:ok, %FormNodeCollection{}} = FormNodeCollections.delete_form_node_collection(form_node_collection)
      assert_raise Ecto.NoResultsError, fn -> FormNodeCollections.get_form_node_collection!(form_node_collection.id) end
    end

    test "change_form_node_collection/1 returns a form_node_collection changeset" do
      form_node_collection = form_node_collection_fixture()
      assert %Ecto.Changeset{} = FormNodeCollections.change_form_node_collection(form_node_collection)
    end
  end
end
