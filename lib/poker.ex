defmodule Poker do
  @moduledoc """
  Coordinates the poker game.
  """
  defstruct [:name, :cards]
  alias Poker.{Cards, Hand}

  @doc """
  Determs a winner.
  iex> Poker.winner([%Poker{name: "Black", cards: ["2H","2D","5S","9C","KD"]}, %Poker{name: "White", cards: ["3H","3D","5S","9C","QD"]}])
  "White wins - pair: 3"
  """
  @spec winner([%Poker{}]) :: String.t
  def winner(hands) do
    # analyze hands
    highest_hands = Enum.map(hands, &highest_hand/1)
    |> Enum.sort_by(fn e -> (elem(e, 0) * -1) end)
    |> Enum.take(2)
    # if head equals second its a Tie
    [first | [second | _]] = highest_hands
    if (elem(first, 0) != elem(second, 0)) do
        "#{elem(first, 1)} wins - #{elem(first, 2)}"
    else
        "Tie"
    end
  end

  @doc """
  Determ the best hand by poker rules
  ## Examples
    iex>Poker.highest_hand(%Poker{name: "Black", cards: ["2H","3D","5S","9C","KD"]})
    {1209050302, "Black", "high card: king"}
  """
  @spec highest_hand(%Poker{}) :: {integer, [%Cards{}], String.t}
  def highest_hand(a) do
    analyzed_cards = Cards.analyze(a.cards)
    cond do
      h = Hand.full_house(analyzed_cards) -> {Hand.value(6, h), a.name, "full house: " <> Cards.name(hd(hd(h).cards))}
      h = Hand.flush(analyzed_cards) -> {Hand.value(5, h), a.name, "flush: " <> Cards.suit(hd(hd(h).cards))}
      h = Hand.straight(analyzed_cards) -> {Hand.value(4, h), a.name, "straight: " <> Cards.name(hd(hd(h).cards))}
      h = Hand.three_of_a_kind(analyzed_cards) -> {Hand.value(3, h), a.name, "three of a kind: " <> Cards.name(hd(hd(h).cards))}
      h = Hand.two_pair(analyzed_cards) -> {Hand.value(2, h), a.name, "two pair: " <> Cards.name(hd(hd(h).cards))}
      h = Hand.pair(analyzed_cards) -> {Hand.value(1, h), a.name, "pair: " <> Cards.name(hd(hd(h).cards))}
      h = Hand.high_card(analyzed_cards) -> {Hand.value(0, h), a.name, "high card: " <> Cards.name(hd(hd(h).cards))}
    end
  end
end
