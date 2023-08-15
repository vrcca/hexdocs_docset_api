defmodule DocsetApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :docset_api,
      version: "0.1.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {DocsetApi, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  defp deps do
    [
      {:phoenix, "~> 1.7"},
      {:phoenix_html, "~> 3.1"},
      {:plug_cowboy, "~> 2.3"},
      {:httpoison, "~> 1.8 or ~> 2.1"},
      {:exqlite, "~> 0.13"},
      {:floki, "~> 0.34"}
    ]
  end
end
