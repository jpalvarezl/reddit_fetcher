defmodule RedditFetcher.MixProject do
  use Mix.Project

  def project do
    [
      app: :reddit_fetcher,
      version: "0.1.0",
      escript: escript(),
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp escript do
    [main_module: RedditFetcher.CLI]
  end

  defp deps do
    [
      httpoison: "~> 1.2.0"
    ]
  end
end
