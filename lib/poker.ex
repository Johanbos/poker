defmodule Poker do
  @moduledoc """
  Coordinates the poker game.
  """
  defstruct [:name, :hand]

  @doc """
  Determs a winner.
  """
  def winner(black, white) do
    b = HighCard.card(black.hand)
    w = HighCard.card(white.hand)
    cond do
        HighCard.value(b) > HighCard.value(w) -> "Black wins - high card: #{HighCard.name(b)}"
        HighCard.value(b) < HighCard.value(w) -> "White wins - high card: #{HighCard.name(w)}"
        true -> "Tie"
    end
  end
end
