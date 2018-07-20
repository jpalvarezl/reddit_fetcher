# RedditFetcher

Command line tool to fetch reddits from r/programming
```bash
mix escript.build
./reddit_fetcher
# OR
./reddit_fetch --verbose #for console output
```

Reddits are dumped into `programming.json` for offline mode. The file is added to the `.gitignore` list.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `reddit_fetcher` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:reddit_fetcher, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/reddit_fetcher](https://hexdocs.pm/reddit_fetcher).
