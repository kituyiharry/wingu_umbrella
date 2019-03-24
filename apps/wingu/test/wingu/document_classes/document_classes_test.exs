defmodule Wingu.DocumentClassesTest do
  use Wingu.DataCase

  alias Wingu.DocumentClasses

  describe "document_class" do
    alias Wingu.DocumentClasses.DocumentClass

    @valid_attrs %{class_description: "some class_description", classname: "some classname"}
    @update_attrs %{class_description: "some updated class_description", classname: "some updated classname"}
    @invalid_attrs %{class_description: nil, classname: nil}

    def document_class_fixture(attrs \\ %{}) do
      {:ok, document_class} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DocumentClasses.create_document_class()

      document_class
    end

    test "list_document_class/0 returns all document_class" do
      document_class = document_class_fixture()
      assert DocumentClasses.list_document_class() == [document_class]
    end

    test "get_document_class!/1 returns the document_class with given id" do
      document_class = document_class_fixture()
      assert DocumentClasses.get_document_class!(document_class.id) == document_class
    end

    test "create_document_class/1 with valid data creates a document_class" do
      assert {:ok, %DocumentClass{} = document_class} = DocumentClasses.create_document_class(@valid_attrs)
      assert document_class.class_description == "some class_description"
      assert document_class.classname == "some classname"
    end

    test "create_document_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DocumentClasses.create_document_class(@invalid_attrs)
    end

    test "update_document_class/2 with valid data updates the document_class" do
      document_class = document_class_fixture()
      assert {:ok, %DocumentClass{} = document_class} = DocumentClasses.update_document_class(document_class, @update_attrs)
      assert document_class.class_description == "some updated class_description"
      assert document_class.classname == "some updated classname"
    end

    test "update_document_class/2 with invalid data returns error changeset" do
      document_class = document_class_fixture()
      assert {:error, %Ecto.Changeset{}} = DocumentClasses.update_document_class(document_class, @invalid_attrs)
      assert document_class == DocumentClasses.get_document_class!(document_class.id)
    end

    test "delete_document_class/1 deletes the document_class" do
      document_class = document_class_fixture()
      assert {:ok, %DocumentClass{}} = DocumentClasses.delete_document_class(document_class)
      assert_raise Ecto.NoResultsError, fn -> DocumentClasses.get_document_class!(document_class.id) end
    end

    test "change_document_class/1 returns a document_class changeset" do
      document_class = document_class_fixture()
      assert %Ecto.Changeset{} = DocumentClasses.change_document_class(document_class)
    end
  end
end
