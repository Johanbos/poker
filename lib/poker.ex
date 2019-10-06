defmodule Poker do
  @moduledoc """
  Coordinates the poker game.
  """
  defstruct [:name, :hand]

  @doc """
  Determs a winner.
  """
  def winner(a, b) do
    acard = Hand.high_card(a.hand)
    bcard = Hand.high_card(b.hand)
    cond do
        Card.value(acard) > Card.value(bcard) -> "#{a.name} wins - high card: #{Card.name(acard)}"
        Card.value(acard) < Card.value(bcard) -> "#{b.name} wins - high card: #{Card.name(bcard)}"
        true -> "Tie"
    end
  end
end
