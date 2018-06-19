defmodule RedditFetcher.CLI do

  def main(args \\ []) do
    args
    |> parse_args
    |> response
  end

  defp parse_args(args) do
  {opts, word, _} =
    args
    |> OptionParser.parse(switches: [verbose: :boolean])

    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    if opts[:verbose], do: "VERBOSE MODE IS ON BITCH: #{word}", else: word
    fetch_comments()
  end

  defp fetch_comments() do
    {:ok, response} = HTTPoison.get("https://www.reddit.com/r/programming.json")
    # File.write!("./programming.json", response.body)
    response.body
    |> Poison.decode!
    |> Map.get("data")
    |> Map.get("children")
    |> IO.inspect
  end

end
