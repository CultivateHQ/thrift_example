defmodule ThriftExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :thrift_example,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      compilers: [:thrift | Mix.compilers()],
      thrift: thrift(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ThriftExample.Application, []}
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 0.5"},
      {:credo, "~>  0.9.0-rc7"},
      {:thrift, github: "CultivateHQ/elixir-thrift"}
    ]
  end

  defp thrift do
    [files: Path.wildcard("thrift/**/*.thrift")]
  end
end
