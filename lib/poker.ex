defmodule Poker do
  @moduledoc """
  Coordinates the poker game.
  """

  @doc """
  Determs a winner.
  """
  def winner(black, white) do
    b = HighCard.card(black)
    w = HighCard.card(white)
    cond do
        HighCard.value(b) > HighCard.value(w) -> "Black wins: Highcard #{b}"
        HighCard.value(b) < HighCard.value(w) -> "White wins: Highcard #{w}"
        true -> "Tie"
    end
  end
end
