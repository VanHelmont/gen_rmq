defmodule GenRMQ.Mixfile do
  use Mix.Project

  @version "2.7.0"

  def project do
    [
      app: :gen_rmq,
      version: @version,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      description: description(),
      package: package(),
      source_url: "https://github.com/meltwater/gen_rmq",
      docs: [
        extras: ["README.md"],
        main: "readme",
        source_ref: "v#{@version}",
        source_url: "https://github.com/meltwater/gen_rmq"
      ],
      dialyzer: [
        plt_add_apps: [:mix],
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support", "examples"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:amqp, "~> 1.6"},
      {:telemetry, "~> 1.0"},
      {:credo, "~> 1.6", only: :dev, runtime: false},
      {:excoveralls, "~> 0.14.0", only: :test},
      {:jason, "~> 1.3", only: [:dev, :test]},
      {:earmark, "~> 1.4", only: :dev},
      {:ex_doc, "~> 0.28.0", only: :dev},
      {:dialyxir, "~> 1.1.0", only: [:dev], runtime: false}
    ]
  end

  defp description() do
    "Set of behaviours meant to be used to create RabbitMQ consumers and publishers."
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Mateusz Korszun"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/meltwater/gen_rmq"}
    ]
  end
end
