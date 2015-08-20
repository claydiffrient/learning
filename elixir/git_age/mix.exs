defmodule GitAge.Mixfile do
  use Mix.Project

  def project do
    [app: :git_age,
     version: "0.0.1",
     elixir: "~> 1.0",
     escript: [main_module: GitAge],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: Coverex.Task],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:mix_test_watch, "~> 0.1.1", only: :dev},
      {:timex, "~> 0.17.0"},
      {:coverex, "~> 1.4.1", only: :test}
    ]
  end
end
