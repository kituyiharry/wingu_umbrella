defmodule Wingu.TextNodeDataTest do
  use Wingu.DataCase

  alias Wingu.TextNodeData

  describe "text_node_data" do
    alias Wingu.TextNodeData.TextNodeDatum

    @valid_attrs %{node_value: "some node_value"}
    @update_attrs %{node_value: "some updated node_value"}
    @invalid_attrs %{node_value: nil}

    def text_node_datum_fixture(attrs \\ %{}) do
      {:ok, text_node_datum} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TextNodeData.create_text_node_datum()

      text_node_datum
    end

    test "list_text_node_data/0 returns all text_node_data" do
      text_node_datum = text_node_datum_fixture()
      assert TextNodeData.list_text_node_data() == [text_node_datum]
    end

    test "get_text_node_datum!/1 returns the text_node_datum with given id" do
      text_node_datum = text_node_datum_fixture()
      assert TextNodeData.get_text_node_datum!(text_node_datum.id) == text_node_datum
    end

    test "create_text_node_datum/1 with valid data creates a text_node_datum" do
      assert {:ok, %TextNodeDatum{} = text_node_datum} =
               TextNodeData.create_text_node_datum(@valid_attrs)

      assert text_node_datum.node_value == "some node_value"
    end

    test "create_text_node_datum/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TextNodeData.create_text_node_datum(@invalid_attrs)
    end

    test "update_text_node_datum/2 with valid data updates the text_node_datum" do
      text_node_datum = text_node_datum_fixture()

      assert {:ok, %TextNodeDatum{} = text_node_datum} =
               TextNodeData.update_text_node_datum(text_node_datum, @update_attrs)

      assert text_node_datum.node_value == "some updated node_value"
    end

    test "update_text_node_datum/2 with invalid data returns error changeset" do
      text_node_datum = text_node_datum_fixture()

      assert {:error, %Ecto.Changeset{}} =
               TextNodeData.update_text_node_datum(text_node_datum, @invalid_attrs)

      assert text_node_datum == TextNodeData.get_text_node_datum!(text_node_datum.id)
    end

    test "delete_text_node_datum/1 deletes the text_node_datum" do
      text_node_datum = text_node_datum_fixture()
      assert {:ok, %TextNodeDatum{}} = TextNodeData.delete_text_node_datum(text_node_datum)

      assert_raise Ecto.NoResultsError, fn ->
        TextNodeData.get_text_node_datum!(text_node_datum.id)
      end
    end

    test "change_text_node_datum/1 returns a text_node_datum changeset" do
      text_node_datum = text_node_datum_fixture()
      assert %Ecto.Changeset{} = TextNodeData.change_text_node_datum(text_node_datum)
    end
  end
end
