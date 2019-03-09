defmodule WinguWeb.FormTemplateController do
  use WinguWeb, :controller

  alias Wingu.FormTemplates
  alias Wingu.FormTemplates.FormTemplate

  action_fallback WinguWeb.FallbackController

  def index(conn, _params) do
    form_templates = FormTemplates.list_form_templates()
    render(conn, "index.json", form_templates: form_templates)
  end

  def create(conn, %{"form_template" => form_template_params}) do
    with {:ok, %FormTemplate{} = form_template} <- FormTemplates.create_form_template(form_template_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.form_template_path(conn, :show, form_template))
      |> render("show.json", form_template: form_template)
    end
  end

  def show(conn, %{"id" => id}) do
    form_template = FormTemplates.get_form_template!(id)
    render(conn, "show.json", form_template: form_template)
  end

  def update(conn, %{"id" => id, "form_template" => form_template_params}) do
    form_template = FormTemplates.get_form_template!(id)

    with {:ok, %FormTemplate{} = form_template} <- FormTemplates.update_form_template(form_template, form_template_params) do
      render(conn, "show.json", form_template: form_template)
    end
  end

  def delete(conn, %{"id" => id}) do
    form_template = FormTemplates.get_form_template!(id)

    with {:ok, %FormTemplate{}} <- FormTemplates.delete_form_template(form_template) do
      send_resp(conn, :no_content, "")
    end
  end
end
