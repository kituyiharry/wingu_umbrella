defmodule WinguWeb.SectionDatumView do
  use WinguWeb, :view
  alias WinguWeb.SectionDatumView

  def render("index.json", %{section_data: section_data}) do
    %{data: render_many(section_data, SectionDatumView, "section_datum.json")}
  end

  def render("show.json", %{section_datum: section_datum}) do
    %{data: render_one(section_datum, SectionDatumView, "section_datum.json")}
  end

  def render("section_datum.json", %{section_datum: section_datum}) do
    %{id: section_datum.id}
  end
end
