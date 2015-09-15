defmodule Nerdbeers.Mixfile do
  use Mix.Project

  def project do
    [app: :nerdbeers,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [mod: {Nerdbeers, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    :phoenix_ecto, :postgrex, :rollbax,
                    :exometer, :exometer_core,
                    :lager, :lager_logger]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp deps do
    [{:phoenix, "~> 1.0.0"},
     {:phoenix_ecto, "~> 1.1"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.1"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:cowboy, "~> 1.0"},
     # exception
     {:rollbax, "~> 0.5"},
     # monitoring
     {:exometer_core, github: "PSPDFKit-labs/exometer_core", override: true},
     {:exometer, github: "PSPDFKit-labs/exometer"},
     {:edown, github: "uwiger/edown", tag: "0.7", override: true},

     {:lager_logger, "~> 1.0"},
     {:lager, "~> 2.1", override: true}]
  end
end
