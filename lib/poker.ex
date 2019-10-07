defmodule Poker do
  @moduledoc """
  Coordinates the poker game.
  """
  defstruct [:name, :hand]

  @doc """
  Determs a winner.
  """
  def winner(a, b) do
    a_p = Hand.pair(a.hand)
    b_p = Hand.pair(b.hand)

    cond do
      elem(a_p, 0) > elem(b_p, 0) ->
        "#{a.name} wins - pair: #{elem(a_p, 1) |> hd() |> Card.name}"

      elem(a_p, 0) < elem(b_p, 0) ->
        "#{b.name} wins - pair: #{elem(b_p, 1) |> hd() |> Card.name}"

      true ->
        a_hc = Hand.high_card(a.hand)
        b_hc = Hand.high_card(b.hand)

        cond do
          Card.value(a_hc) > Card.value(b_hc) -> "#{a.name} wins - high card: #{Card.name(a_hc)}"
          Card.value(a_hc) < Card.value(b_hc) -> "#{b.name} wins - high card: #{Card.name(b_hc)}"
          true -> "Tie"
        end
    end
  end
end
