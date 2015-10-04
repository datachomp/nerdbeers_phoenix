use Mix.Config

config :nerdbeers, Nerdbeers.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json"

# Do not print debug messages in production
config :logger, level: :info



# Finally import the config/prod.secret.exs
# which should be versioned separately.
import_config "prod.secret.exs"
