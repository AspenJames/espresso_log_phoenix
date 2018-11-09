# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :espresso_log,
  ecto_repos: [EspressoLog.Repo]

# Configures the endpoint
config :espresso_log, EspressoLogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/OcprhjlxGp8Pre0uLSfXAjHhmibGh7PTy/b+qg6RooGUap8B3vUIV9TYIxfgNC4",
  render_errors: [view: EspressoLogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EspressoLog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian
config :espresso_log, EspressoLog.TokenImpl,
  issuer: "EspressoLog",
  ttl: {1, :days},
  token_ttl: %{
    "refresh" => {30, :days},
    "access" => {1, :days}
  },
  verify_issuer: true,
  secret_key: System.get_env("GUARDIAN_KEY"),
  serializer: Guardian.TestGuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
