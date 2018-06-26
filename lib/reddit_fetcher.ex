defmodule RedditFetcher.CLI do

  @root_url "https://www.reddit.com"

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

  defp response({opts, _}) do
    formatted_comments =
      case fetch_comments() do
        {:ok, comments} ->
          comments
            |> Poison.decode!
            |> Map.get("data")
            |> Map.get("children")
            |> Enum.map(&format_reddit(&1["data"]))
        _ -> []
      end

    if opts[:verbose], do: IO.inspect(formatted_comments), else: nil
  end

  defp fetch_comments() do
    {code, response} = HTTPoison.get(@root_url<>"/r/programming.json")

    case code do
      :ok ->
        File.write!("./programming.json", response.body)
        {:ok, response.body}
      :error -> File.read("./programming.json")
    end
  end

  defp format_reddit(reddit) do
    %{
      title: reddit["title"],
      permalink: @root_url<>reddit["permalink"]
    }
  end
end
