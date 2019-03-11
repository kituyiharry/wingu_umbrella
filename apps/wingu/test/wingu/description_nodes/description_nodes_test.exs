defmodule Wingu.DescriptionNodesTest do
  use Wingu.DataCase

  alias Wingu.DescriptionNodes

  describe "description_nodes" do
    alias Wingu.DescriptionNodes.DescriptionNode

    @valid_attrs %{isrequired: true, label: "some label", placeholder: "some placeholder"}
    @update_attrs %{
      isrequired: false,
      label: "some updated label",
      placeholder: "some updated placeholder"
    }
    @invalid_attrs %{isrequired: nil, label: nil, placeholder: nil}

    def description_node_fixture(attrs \\ %{}) do
      {:ok, description_node} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DescriptionNodes.create_description_node()

      description_node
    end

    test "list_description_nodes/0 returns all description_nodes" do
      description_node = description_node_fixture()
      assert DescriptionNodes.list_description_nodes() == [description_node]
    end

    test "get_description_node!/1 returns the description_node with given id" do
      description_node = description_node_fixture()
      assert DescriptionNodes.get_description_node!(description_node.id) == description_node
    end

    test "create_description_node/1 with valid data creates a description_node" do
      assert {:ok, %DescriptionNode{} = description_node} =
               DescriptionNodes.create_description_node(@valid_attrs)

      assert description_node.isrequired == true
      assert description_node.label == "some label"
      assert description_node.placeholder == "some placeholder"
    end

    test "create_description_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               DescriptionNodes.create_description_node(@invalid_attrs)
    end

    test "update_description_node/2 with valid data updates the description_node" do
      description_node = description_node_fixture()

      assert {:ok, %DescriptionNode{} = description_node} =
               DescriptionNodes.update_description_node(description_node, @update_attrs)

      assert description_node.isrequired == false
      assert description_node.label == "some updated label"
      assert description_node.placeholder == "some updated placeholder"
    end

    test "update_description_node/2 with invalid data returns error changeset" do
      description_node = description_node_fixture()

      assert {:error, %Ecto.Changeset{}} =
               DescriptionNodes.update_description_node(description_node, @invalid_attrs)

      assert description_node == DescriptionNodes.get_description_node!(description_node.id)
    end

    test "delete_description_node/1 deletes the description_node" do
      description_node = description_node_fixture()

      assert {:ok, %DescriptionNode{}} =
               DescriptionNodes.delete_description_node(description_node)

      assert_raise Ecto.NoResultsError, fn ->
        DescriptionNodes.get_description_node!(description_node.id)
      end
    end

    test "change_description_node/1 returns a description_node changeset" do
      description_node = description_node_fixture()
      assert %Ecto.Changeset{} = DescriptionNodes.change_description_node(description_node)
    end
  end
end
