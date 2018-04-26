# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :report,
  ecto_repos: [Report.Repo]

# Configures the endpoint
config :report, ReportWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+0KnkYldnuwA8b28A4dqhS15z9hs1W7fjCgyGYmGaMHtB2mdpITWadB/ma1iu8oz",
  render_errors: [view: ReportWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Report.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
