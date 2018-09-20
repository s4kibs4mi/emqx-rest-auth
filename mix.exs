defmodule EmqxRestAuth.Mixfile do
  use Mix.Project

  def project do
    [
      app: :emqx_rest_auth,
      version: "2.3.2",
      elixir: "~> 1.5-dev",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EmqElixirPlugin, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
    ]
  end
end
