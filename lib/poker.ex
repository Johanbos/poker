defmodule Poker do
  @moduledoc """
  Coordinates the poker game.
  """
  defstruct [:name, :cards]
  alias Poker.{Card, Hand}

  @doc """
  Determs a winner.
  iex> Poker.winner([%Poker{name: "Black", cards: ["2H","2D","5S","9C","KD"]}, %Poker{name: "White", cards: ["3H","3D","5S","9C","QD"]}])
  "White wins - pair: 3"
  """
  @spec winner([%Poker{}]) :: String.t
  def winner(hands) do
    # analyze hands
    highest_hands = Enum.map(hands, &highest_hand/1)
    # sort by highest and then card values
    |> Enum.sort_by(fn e -> (elem(e, 0) * -1000) - (elem(e, 1))  end)
    |> Enum.take(2)
    # if head equals second its a Tie
    [first | [second | _]] = highest_hands
    if (elem(first, 0) == elem(second, 0) && elem(first, 1) == elem(second, 1)) do
        "Tie"
    else
        elem(first, 2)
    end
  end

  @doc """
  Determ the best hand by poker rules
  ## Examples
    iex>Poker.highest_hand(%Poker{name: "x", cards: ["2H","3D","5S","9C","KD"]})
    {0, 12, "x wins - high card: king"}
    iex>Poker.highest_hand(%Poker{name: "x", cards: ["JH","3D","5S","JC","KD"]})
    {1, 10, "x wins - pair: jack"}
    iex>Poker.highest_hand(%Poker{name: "x", cards: ["JH","3D","3S","JC","KD"]})
    {2, 10, "x wins - two pair: jack"}
    iex>Poker.highest_hand(%Poker{name: "x", cards: ["AH","QD","QS","QC","KD"]})
    {3, 11, "x wins - three of a kind: queen"}
  """
  @spec highest_hand(%Poker{}) :: {integer, integer, String.t}
  def highest_hand(a) do
    analyzed_cards = Card.analyze(a.cards)
    cond do
      #h = full house
      #h = flush
      h = Hand.three_of_a_kind(analyzed_cards) -> {3, h.value, "#{a.name} wins - three of a kind: " <> Card.name(hd(h.cards))}
      h = Hand.two_pair(analyzed_cards) -> {2, h.value, "#{a.name} wins - two pair: " <> Card.name(hd(h.cards))}
      h = Hand.pair(analyzed_cards) -> {1, h.value, "#{a.name} wins - pair: " <> Card.name(hd(h.cards)) }
      h = Hand.high_card(analyzed_cards) -> {0, h.value, "#{a.name} wins - high card: " <> Card.name(hd(h.cards))}
    end
  end
end
