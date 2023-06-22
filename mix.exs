defmodule Gangster.MixProject do
  use Mix.Project

  def project do
    [
      app: :gangster,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Gangster.Application, []}
    ]
  end

  defp deps do
    [
      {:plug, "1.14.2"},
      {:jason, "1.4.0"},
      {:websock, "0.5.2"},
      {:bandit, "1.0.0-pre.9"}
    ]
  end
end
