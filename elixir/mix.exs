defmodule SerializationShowdown.Mixfile do
  use Mix.Project

  def project do
    [
      app: :serialization_showdown,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixirc_paths: ["benchmarks"],
      compilers: Mix.compilers,
      deps: deps
    ]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:message_pack, "~> 0.1.4"},
      {:msgpax, "~> 0.5"},
      {:json, "~> 0.3.0"},
      {:exjsx, "~> 3.1.0"},
      {:poison, "~> 1.3.1"},
      {:jiffy, github: "davisp/jiffy"},
    ]
  end
end
