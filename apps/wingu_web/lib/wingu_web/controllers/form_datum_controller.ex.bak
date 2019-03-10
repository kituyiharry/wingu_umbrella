defmodule WinguWeb.FormDatumController do
  use WinguWeb, :controller

  alias Wingu.FormData
  alias Wingu.FormData.FormDatum

  action_fallback WinguWeb.FallbackController

  def index(conn, _params) do
    form_data = FormData.list_form_data()
    render(conn, "index.json", form_data: form_data)
  end

  def create(conn, %{"form_datum" => form_datum_params}) do
    with {:ok, %FormDatum{} = form_datum} <- FormData.create_form_datum(form_datum_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.form_datum_path(conn, :show, form_datum))
      |> render("show.json", form_datum: form_datum)
    end
  end

  def show(conn, %{"id" => id}) do
    form_datum = FormData.get_form_datum!(id)
    render(conn, "show.json", form_datum: form_datum)
  end

  def update(conn, %{"id" => id, "form_datum" => form_datum_params}) do
    form_datum = FormData.get_form_datum!(id)

    with {:ok, %FormDatum{} = form_datum} <- FormData.update_form_datum(form_datum, form_datum_params) do
      render(conn, "show.json", form_datum: form_datum)
    end
  end

  def delete(conn, %{"id" => id}) do
    form_datum = FormData.get_form_datum!(id)

    with {:ok, %FormDatum{}} <- FormData.delete_form_datum(form_datum) do
      send_resp(conn, :no_content, "")
    end
  end
end
