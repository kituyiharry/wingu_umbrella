defmodule Wingu.FormDataTest do
  use Wingu.DataCase

  alias Wingu.FormData

  describe "form_data" do
    alias Wingu.FormData.FormDatum

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def form_datum_fixture(attrs \\ %{}) do
      {:ok, form_datum} =
        attrs
        |> Enum.into(@valid_attrs)
        |> FormData.create_form_datum()

      form_datum
    end

    test "list_form_data/0 returns all form_data" do
      form_datum = form_datum_fixture()
      assert FormData.list_form_data() == [form_datum]
    end

    test "get_form_datum!/1 returns the form_datum with given id" do
      form_datum = form_datum_fixture()
      assert FormData.get_form_datum!(form_datum.id) == form_datum
    end

    test "create_form_datum/1 with valid data creates a form_datum" do
      assert {:ok, %FormDatum{} = form_datum} = FormData.create_form_datum(@valid_attrs)
    end

    # test "create_form_datum/1 with invalid data returns error changeset" do
    # assert {:error, %Ecto.Changeset{}} = FormData.create_form_datum(@invalid_attrs)
    # end

    test "update_form_datum/2 with valid data updates the form_datum" do
      form_datum = form_datum_fixture()

      assert {:ok, %FormDatum{} = form_datum} =
               FormData.update_form_datum(form_datum, @update_attrs)
    end

    # test "update_form_datum/2 with invalid data returns error changeset" do
    # form_datum = form_datum_fixture()
    # assert {:error, %Ecto.Changeset{}} = FormData.update_form_datum(form_datum, @invalid_attrs)
    # assert form_datum == FormData.get_form_datum!(form_datum.id)
    # end

    test "delete_form_datum/1 deletes the form_datum" do
      form_datum = form_datum_fixture()
      assert {:ok, %FormDatum{}} = FormData.delete_form_datum(form_datum)
      assert_raise Ecto.NoResultsError, fn -> FormData.get_form_datum!(form_datum.id) end
    end

    test "change_form_datum/1 returns a form_datum changeset" do
      form_datum = form_datum_fixture()
      assert %Ecto.Changeset{} = FormData.change_form_datum(form_datum)
    end
  end
end
