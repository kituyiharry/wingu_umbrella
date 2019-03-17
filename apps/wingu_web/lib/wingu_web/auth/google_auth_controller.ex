defmodule WinguWeb.GoogleAuthController do
  use WinguWeb, :controller
  plug Ueberauth

  alias Wingu.{Clients.Client, Repo}

  def callback(
        %Plug.Conn{
          assigns: %{
            ueberauth_auth: %Ueberauth.Auth{credentials: creds, info: client_info, extra: extra}
          }
        } = conn,
        _params
      ) do
    client_params = %{
      firstname: client_info.first_name,
      surname: client_info.last_name,
      picture: client_info.image,
      email: client_info.email,
      email_verified: extra.raw_info.user["email_verified"]
    }

    case Repo.get_by(Client, email: client_info.email) do
      nil ->
        changeset = Client.changeset(%Client{}, client_params)
        client = changeset |> Repo.insert!()
        encode_and_reply(conn, client, creds)

      %Client{} = oldclient ->
        client = Client.changeset(oldclient, client_params) |> Repo.update!()
        encode_and_reply(conn, client, creds)
    end
  end

  def callback(conn, _params) do
    conn
    |> redirect(to: "/404")
  end

  defp encode_and_reply(conn, client, _creds) do
    conn
    |> WinguWeb.Guardian.Plug.sign_in(client)
    |> redirect(to: "/#/home")
  end

  def delete(conn, _params) do
    conn
    |> WinguWeb.Guardian.Plug.sign_out()
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  def request(conn, _params) do
    conn
  end
end
