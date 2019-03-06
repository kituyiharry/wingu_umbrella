defmodule WinguWeb.FormView do
  use WinguWeb, :view
  alias WinguWeb.FormView

  def render("index.json", %{forms: forms}) do
    %{data: render_many(forms, FormView, "form.json")}
  end

  def render("show.json", %{form: form}) do
    %{data: render_one(form, FormView, "form.json")}
  end

  def render("form.json", %{form: form}) do
    %{id: form.id,
      name: form.name,
      summary: form.summary,
      description: form.description}
  end
end
