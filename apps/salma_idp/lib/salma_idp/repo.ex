defmodule SalmaIdp.Repo do
  use Ecto.Repo,
    otp_app: :salma_idp,
    adapter: Ecto.Adapters.Postgres
end
