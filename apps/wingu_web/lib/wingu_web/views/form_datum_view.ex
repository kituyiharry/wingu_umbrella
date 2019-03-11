defmodule WinguWeb.FormDatumView do
  use WinguWeb, :view
  alias WinguWeb.FormDatumView

  def render("index.json", %{form_data: form_data}) do
    %{data: render_many(form_data, FormDatumView, "form_datum.json")}
  end

  def render("show.json", %{form_datum: form_datum}) do
    %{data: render_one(form_datum, FormDatumView, "form_datum.json")}
  end

  def render("form_datum.json", %{form_datum: form_datum}) do
    %{id: form_datum.id}
  end
end
