import Config

config :gangster, Gangster.Endpoint,
  ip: {127, 0, 0, 1},
  port: 6789,
  plug: Gangster.Router,
  thousand_island_options: [read_timeout: :timer.seconds(45)]
