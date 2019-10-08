defmodule Poker.Hand do

  @doc """
  Determ high card from analyzed cards.
  ## Examples
    iex> Poker.Hand.high_card([%Poker.Card{cards: ["9C"], value: 9}])
    %Poker.Card{cards: ["9C"], value: 9}
  """
  def high_card(analyzed_cards) do
    hd(analyzed_cards)
  end

  @doc """
  Determ the highest pair from analyzed cards
  ## Examples
    iex> Poker.Hand.pair([ %Poker.Card{cards: ["9C"], value: 9}, %Poker.Card{cards: ["5S", "5D"], value: 5}, %Poker.Card{cards: ["3D"], value: 3}, %Poker.Card{cards: ["2H"], value: 2}])
    %Poker.Card{cards: ["5S", "5D"], value: 5}

    iex> Poker.Hand.pair([ %Poker.Card{cards: ["9C"], value: 9}, %Poker.Card{cards: ["5S"], value: 5}, %Poker.Card{cards: ["3D"], value: 3}, %Poker.Card{cards: ["2H"], value: 2}])
    nil
  """
  @spec pair([%Poker.Card{}]) :: %Poker.Card{}
  def pair(analyzed_cards) do
    pairs = Enum.filter(analyzed_cards, fn c -> length(c.cards) === 2 end)
    if (pairs == []) do
        nil
    else
        hd(pairs)
    end
  end
end
