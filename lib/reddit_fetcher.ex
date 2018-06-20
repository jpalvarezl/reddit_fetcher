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
    if opts[:verbose], do: "VERBOSE MODE IS ON: #{word}", else: word
    fetch_comments()
  end

  defp fetch_comments() do
    # {:ok, response} = HTTPoison.get("https://www.reddit.com/r/programming.json")
    # File.write!("./programming.json", response.body)
    # response.body
    {:ok, file} = File.read("./programming.json")
    file
    |> Poison.decode!
    |> Map.get("data")
    |> Map.get("children")
    |> Enum.map(&format_reddit(&1))
    |> IO.inspect
  end

  defp format_reddit(reddit) do
    data = Map.get(reddit, "data")
    %{
      title: Map.get(data, "title"),
      permalink: "https://reddit.com#{Map.get(data, "permalink")}"
    }
  end

end
