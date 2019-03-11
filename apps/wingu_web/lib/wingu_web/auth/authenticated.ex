defmodule WinguWeb.Authenticated do
  use Guardian.Plug.Pipeline,
    otp_app: :wingu_web,
    module: WinguWeb.Guardian,
    error_handler: WinguWeb.AuthErrorHandler

  # plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
