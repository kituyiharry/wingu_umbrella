# Since configuration is shared in umbrella projects, this file
# should only configure the :wingu_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :wingu_web,
  ecto_repos: [Wingu.Repo],
  generators: [context_app: :wingu, binary_id: true]

# Configures the endpoint
config :wingu_web, WinguWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1NoxqZCU6HAm4ljaWZG8yincWVs9jSXZEqXTYVagYkUBDX2czffDCcckbbvP6p0H",
  render_errors: [view: WinguWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WinguWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
