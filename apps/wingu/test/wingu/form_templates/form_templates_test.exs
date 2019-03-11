defmodule Wingu.FormTemplatesTest do
  use Wingu.DataCase

  alias Wingu.FormTemplates

  describe "form_templates" do
    alias Wingu.FormTemplates.FormTemplate

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def form_template_fixture(attrs \\ %{}) do
      {:ok, form_template} =
        attrs
        |> Enum.into(@valid_attrs)
        |> FormTemplates.create_form_template()

      form_template
    end

    test "list_form_templates/0 returns all form_templates" do
      form_template = form_template_fixture()
      assert FormTemplates.list_form_templates() == [form_template]
    end

    test "get_form_template!/1 returns the form_template with given id" do
      form_template = form_template_fixture()
      assert FormTemplates.get_form_template!(form_template.id) == form_template
    end

    test "create_form_template/1 with valid data creates a form_template" do
      assert {:ok, %FormTemplate{} = form_template} =
               FormTemplates.create_form_template(@valid_attrs)
    end

    # test "create_form_template/1 with invalid data returns error changeset" do
    # assert {:error, %Ecto.Changeset{}} = FormTemplates.create_form_template(@invalid_attrs)
    # end

    test "update_form_template/2 with valid data updates the form_template" do
      form_template = form_template_fixture()

      assert {:ok, %FormTemplate{} = form_template} =
               FormTemplates.update_form_template(form_template, @update_attrs)
    end

    # test "update_form_template/2 with invalid data returns error changeset" do
    # form_template = form_template_fixture()
    # assert {:error, %Ecto.Changeset{}} = FormTemplates.update_form_template(form_template, @invalid_attrs)
    # assert form_template == FormTemplates.get_form_template!(form_template.id)
    # end

    test "delete_form_template/1 deletes the form_template" do
      form_template = form_template_fixture()
      assert {:ok, %FormTemplate{}} = FormTemplates.delete_form_template(form_template)

      assert_raise Ecto.NoResultsError, fn ->
        FormTemplates.get_form_template!(form_template.id)
      end
    end

    test "change_form_template/1 returns a form_template changeset" do
      form_template = form_template_fixture()
      assert %Ecto.Changeset{} = FormTemplates.change_form_template(form_template)
    end
  end
end
