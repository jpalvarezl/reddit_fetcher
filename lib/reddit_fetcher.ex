defmodule RedditFetcher.CLI do

  def main(args \\ []) do
    args
    |> parse_args
    |> response
    |> IO.inspect
  end

  defp parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [verbose: :boolean])

    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    if opts[:verbose], do: "VERBOSE MODE IS ON BITCH: #{word}", else: word
  end

end
