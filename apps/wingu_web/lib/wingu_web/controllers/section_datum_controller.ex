defmodule WinguWeb.SectionDatumController do
  use WinguWeb, :controller

  alias Wingu.SectionData
  alias Wingu.SectionData.SectionDatum

  action_fallback WinguWeb.FallbackController

  def index(conn, _params) do
    section_data = SectionData.list_section_data()
    render(conn, "index.json", section_data: section_data)
  end

  def create(conn, %{"section_datum" => section_datum_params}) do
    with {:ok, %SectionDatum{} = section_datum} <- SectionData.create_section_datum(section_datum_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.section_datum_path(conn, :show, section_datum))
      |> render("show.json", section_datum: section_datum)
    end
  end

  def show(conn, %{"id" => id}) do
    section_datum = SectionData.get_section_datum!(id)
    render(conn, "show.json", section_datum: section_datum)
  end

  def update(conn, %{"id" => id, "section_datum" => section_datum_params}) do
    section_datum = SectionData.get_section_datum!(id)

    with {:ok, %SectionDatum{} = section_datum} <- SectionData.update_section_datum(section_datum, section_datum_params) do
      render(conn, "show.json", section_datum: section_datum)
    end
  end

  def delete(conn, %{"id" => id}) do
    section_datum = SectionData.get_section_datum!(id)

    with {:ok, %SectionDatum{}} <- SectionData.delete_section_datum(section_datum) do
      send_resp(conn, :no_content, "")
    end
  end
end
