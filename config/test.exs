use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :espresso_log, EspressoLogWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :espresso_log, EspressoLog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "espresso_log_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
