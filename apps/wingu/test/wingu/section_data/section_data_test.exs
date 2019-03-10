defmodule Wingu.SectionDataTest do
  use Wingu.DataCase

  alias Wingu.SectionData

  describe "section_data" do
    alias Wingu.SectionData.SectionDatum

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def section_datum_fixture(attrs \\ %{}) do
      {:ok, section_datum} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SectionData.create_section_datum()

      section_datum
    end

    test "list_section_data/0 returns all section_data" do
      section_datum = section_datum_fixture()
      assert SectionData.list_section_data() == [section_datum]
    end

    test "get_section_datum!/1 returns the section_datum with given id" do
      section_datum = section_datum_fixture()
      assert SectionData.get_section_datum!(section_datum.id) == section_datum
    end

    test "create_section_datum/1 with valid data creates a section_datum" do
      assert {:ok, %SectionDatum{} = section_datum} = SectionData.create_section_datum(@valid_attrs)
    end

    #test "create_section_datum/1 with invalid data returns error changeset" do
      #assert {:error, %Ecto.Changeset{}} = SectionData.create_section_datum(@invalid_attrs)
    #end

    test "update_section_datum/2 with valid data updates the section_datum" do
      section_datum = section_datum_fixture()
      assert {:ok, %SectionDatum{} = section_datum} = SectionData.update_section_datum(section_datum, @update_attrs)
    end

    #test "update_section_datum/2 with invalid data returns error changeset" do
      #section_datum = section_datum_fixture()
      #assert {:error, %Ecto.Changeset{}} = SectionData.update_section_datum(section_datum, @invalid_attrs)
      #assert section_datum == SectionData.get_section_datum!(section_datum.id)
    #end

    test "delete_section_datum/1 deletes the section_datum" do
      section_datum = section_datum_fixture()
      assert {:ok, %SectionDatum{}} = SectionData.delete_section_datum(section_datum)
      assert_raise Ecto.NoResultsError, fn -> SectionData.get_section_datum!(section_datum.id) end
    end

    test "change_section_datum/1 returns a section_datum changeset" do
      section_datum = section_datum_fixture()
      assert %Ecto.Changeset{} = SectionData.change_section_datum(section_datum)
    end
  end
end
