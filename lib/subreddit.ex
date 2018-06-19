defmodule Subreddit do
  @derive [Poison.Encoder]
  defstruct [:data, :childen]  
end
