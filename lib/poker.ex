defmodule Poker do
  @moduledoc """
  Coordinates the poker game.
  """
  defstruct [:name, :cards]
  alias Poker.{Card, Hand}

  @doc """
  Determs a winner.
  """
  @spec winner(%Poker{}, %Poker{}) :: String.t
  #todo: @spec winner([%Poker{}]) :: String.t
  def winner(a, b) do
    a_hand = highest_hand(a)
    b_hand = highest_hand(b)
    cond do
        # wins by hand
        elem(a_hand, 0) > elem(b_hand,0) -> "#{a.name} wins - #{elem(a_hand, 2)}"
        elem(a_hand, 0) < elem(b_hand,0) -> "#{b.name} wins - #{elem(b_hand, 2)}"
        # wins by value with same hand
        elem(a_hand, 1) > elem(b_hand,1) -> "#{a.name} wins - #{elem(a_hand, 2)}"
        elem(a_hand, 1) < elem(b_hand,1) -> "#{b.name} wins - #{elem(b_hand, 2)}"
        true -> "Tie"
    end
  end

  @doc """
  Determ the best hand by poker rules
  ## Examples
    iex>Poker.highest_hand(%Poker{cards: ["2H","3D","5S","9C","KD"]})
    {0, 12, "high card: king"}
    iex>Poker.highest_hand(%Poker{cards: ["JH","3D","5S","JC","KD"]})
    {1, 10, "pair: jack"}
    iex>Poker.highest_hand(%Poker{cards: ["JH","3D","3S","JC","KD"]})
    {2, 10, "two pair: jack"}
    iex>Poker.highest_hand(%Poker{cards: ["AH","QD","QS","QC","KD"]})
    {3, 11, "three of a kind: queen"}
  """
  @spec highest_hand(%Poker{}) :: {integer, integer, String.t}
  def highest_hand(a) do
    analyzed_cards = Card.analyze(a.cards)
    cond do
      #h = full house
      #h = flush
      h = Hand.three_of_a_kind(analyzed_cards) -> {3, h.value, "three of a kind: " <> Card.name(hd(h.cards))}
      h = Hand.two_pair(analyzed_cards) -> {2, h.value, "two pair: " <> Card.name(hd(h.cards))}
      h = Hand.pair(analyzed_cards) -> {1, h.value, "pair: " <> Card.name(hd(h.cards)) }
      h = Hand.high_card(analyzed_cards) -> {0, h.value, "high card: " <> Card.name(hd(h.cards))}
    end
  end
end
