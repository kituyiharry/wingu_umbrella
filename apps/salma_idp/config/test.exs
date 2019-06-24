use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :salma_idp, SalmaIdpWeb.Endpoint,
  http: [port: 4102],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :salma_idp, SalmaIdp.Repo,
  username: "postgres",
  password: "postgres",
  database: "salma_idp_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
