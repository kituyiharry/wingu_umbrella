# Since configuration is shared in umbrella projects, this file
# should only configure the :wingu application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :wingu,
  ecto_repos: [Wingu.Repo]

import_config "#{Mix.env()}.exs"
