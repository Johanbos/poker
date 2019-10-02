defmodule Poker do
  use Agent

  @moduledoc """
  Coordinates the poker game.
  """

  @doc """
  Starts a Poker game.
  """
  def start(input) do
    Agent.start_link(fn -> input end, name: __MODULE__)
  end

  @doc """
  Determs a winner.
  """
  def winner do
    input = Agent.get(__MODULE__, & &1)
    HighCard.card(input)
  end
end
