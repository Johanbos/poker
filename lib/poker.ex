defmodule Poker do
  use Agent
  @moduledoc """
  Documentation for Poker.
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
    Agent.get(__MODULE__, & &1)
  end
end
