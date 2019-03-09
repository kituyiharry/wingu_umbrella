defmodule WinguWeb.FormTemplateView do
  use WinguWeb, :view
  alias WinguWeb.FormTemplateView

  def render("index.json", %{form_templates: form_templates}) do
    %{data: render_many(form_templates, FormTemplateView, "form_template.json")}
  end

  def render("show.json", %{form_template: form_template}) do
    %{data: render_one(form_template, FormTemplateView, "form_template.json")}
  end

  def render("form_template.json", %{form_template: form_template}) do
    %{id: form_template.id}
  end
end
