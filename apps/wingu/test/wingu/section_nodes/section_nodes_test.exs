defmodule Wingu.SectionNodesTest do
  use Wingu.DataCase

  alias Wingu.SectionNodes

  describe "section_nodes" do
    alias Wingu.SectionNodes.SectionNode

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def section_node_fixture(attrs \\ %{}) do
      {:ok, section_node} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SectionNodes.create_section_node()

      section_node
    end

    test "list_section_nodes/0 returns all section_nodes" do
      section_node = section_node_fixture()
      assert SectionNodes.list_section_nodes() == [section_node]
    end

    test "get_section_node!/1 returns the section_node with given id" do
      section_node = section_node_fixture()
      assert SectionNodes.get_section_node!(section_node.id) == section_node
    end

    test "create_section_node/1 with valid data creates a section_node" do
      assert {:ok, %SectionNode{} = section_node} = SectionNodes.create_section_node(@valid_attrs)
      assert section_node.description == "some description"
      assert section_node.name == "some name"
    end

    test "create_section_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SectionNodes.create_section_node(@invalid_attrs)
    end

    test "update_section_node/2 with valid data updates the section_node" do
      section_node = section_node_fixture()

      assert {:ok, %SectionNode{} = section_node} =
               SectionNodes.update_section_node(section_node, @update_attrs)

      assert section_node.description == "some updated description"
      assert section_node.name == "some updated name"
    end

    test "update_section_node/2 with invalid data returns error changeset" do
      section_node = section_node_fixture()

      assert {:error, %Ecto.Changeset{}} =
               SectionNodes.update_section_node(section_node, @invalid_attrs)

      assert section_node == SectionNodes.get_section_node!(section_node.id)
    end

    test "delete_section_node/1 deletes the section_node" do
      section_node = section_node_fixture()
      assert {:ok, %SectionNode{}} = SectionNodes.delete_section_node(section_node)
      assert_raise Ecto.NoResultsError, fn -> SectionNodes.get_section_node!(section_node.id) end
    end

    test "change_section_node/1 returns a section_node changeset" do
      section_node = section_node_fixture()
      assert %Ecto.Changeset{} = SectionNodes.change_section_node(section_node)
    end
  end
end
