defmodule Wingu.Repo do
  use Ecto.Repo,
    otp_app: :wingu,
    adapter: Ecto.Adapters.Postgres
end
