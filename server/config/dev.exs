import Config

config :live_sketch, LiveSketchWeb.Endpoint,
  http: [port: 4000],
  url: [host: "localhost", port: 4000],
  # Generate with mix phx.gen.secret
  secret_key_base: "your-secret-key-base-here",
  render_errors: [accepts: ~w(html json), layout: false],
  pubsub_server: LiveSketch.PubSub

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason
