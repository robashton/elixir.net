defmodule Eg.MixProject do
  use Mix.Project

  def project do
    [
      app: :eg,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :dotnet],
      mod: {Eg, []},
    ]
  end

  defp deps do
    [
      {:dotnet, git: "https://github.com/robashton/erlang.net.git", branch: "master"}
    ]
  end
end
