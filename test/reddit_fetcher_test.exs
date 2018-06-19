defmodule RedditFetcherTest do
  use ExUnit.Case
  doctest RedditFetcher

  test "greets the world" do
    assert RedditFetcher.hello() == :world
  end
end
