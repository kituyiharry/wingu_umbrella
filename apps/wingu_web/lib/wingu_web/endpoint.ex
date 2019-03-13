defmodule WinguWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :wingu_web
  use Absinthe.Phoenix.Endpoint

  socket "/socket", WinguWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :wingu_web,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt manifest.json favicon-32x32.png favicon-16x16.png favicon-96x96.png android-icon-192x192.png apple-icon-114x114.png apple-icon-120x120.png apple-icon-144x144.png apple-icon-152x152.png apple-icon-180x180.png apple-icon-76x76.png apple-icon-72x72.png apple-icon-60x60.png apple-icon-57x57.png ms-icon-144x144.png wingu_hi_res_512.png)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_wingu_web_key",
    signing_salt: "nVr4dxH/"

  plug WinguWeb.Router
end
