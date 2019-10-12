defmodule Poker.Hand do
    @doc """
    Determ the value of the hand.
    ## Examples
    iex> Poker.Hand.value(1, [%Poker.Cards{cards: ["9C", "9D"], value: 9}, %Poker.Cards{cards: ["8D"], value: 8}])
    1090908
    """
    @spec value(integer, [%Poker.Cards{}]) :: integer
    def value(type, analyzed_cards) do
        cardvalues = Enum.map(analyzed_cards, fn (x) -> Integer.to_string(x.value) |> String.pad_leading(2, "0") |> String.duplicate(length(x.cards)) end)
        |> Enum.join()
        String.to_integer("#{type}#{cardvalues}")
    end

    @doc """
    Determ high card from analyzed cards.
    ## Examples
    iex> Poker.Hand.high_card([%Poker.Cards{cards: ["9C"], value: 9}, %Poker.Cards{cards: ["8D"], value: 8}])
    [
        %Poker.Cards{cards: ["9C"], value: 9},
        %Poker.Cards{cards: ["8D"], value: 8}
    ]
    """
    @spec high_card([%Poker.Cards{}]) :: [%Poker.Cards{}]
    def high_card(analyzed_cards) do
        analyzed_cards
    end


    @doc """
    Determ the highest pair from analyzed cards
    ## Examples
    iex> Poker.Hand.pair([ %Poker.Cards{cards: ["9C"], value: 9}, %Poker.Cards{cards: ["5S", "5D"], value: 5}, %Poker.Cards{cards: ["3D"], value: 3}, %Poker.Cards{cards: ["2H"], value: 2}])
    [
        %Poker.Cards{cards: ["5S", "5D"], value: 5},
        %Poker.Cards{cards: ["9C"], value: 9},
        %Poker.Cards{cards: ["3D"], value: 3},
        %Poker.Cards{cards: ["2H"], value: 2}
    ]

    iex> Poker.Hand.pair([ %Poker.Cards{cards: ["9C"], value: 9}, %Poker.Cards{cards: ["5S"], value: 5}, %Poker.Cards{cards: ["3D"], value: 3}, %Poker.Cards{cards: ["2H"], value: 2}])
    nil
    """
    @spec pair([%Poker.Cards{}]) :: [%Poker.Cards{}]
    def pair(analyzed_cards) do
        {pairs, remainder} = Enum.split_with(analyzed_cards, fn c -> length(c.cards) === 2 end)
        case pairs do
      [] -> nil
      [_] -> Enum.concat(pairs, remainder)
      _ -> nil
    end
end

    @doc """
    Determ the highest two pair from analyzed cards
    ## Examples
    iex> Poker.Hand.two_pair([ %Poker.Cards{cards: ["9C"], value: 9}, %Poker.Cards{cards: ["5S", "5D"], value: 5}, %Poker.Cards{cards: ["3D"], value: 3}, %Poker.Cards{cards: ["2H"], value: 2}])
    nil

    iex> Poker.Hand.two_pair([ %Poker.Cards{cards: ["9C", "9H"], value: 9}, %Poker.Cards{cards: ["5S"], value: 5}, %Poker.Cards{cards: ["3D", "3H"], value: 3}, %Poker.Cards{cards: ["2H"], value: 2}])
    [
        %Poker.Cards{cards: ["9C", "9H"], value: 9},
        %Poker.Cards{cards: ["3D", "3H"], value: 3},
        %Poker.Cards{cards: ["5S"], value: 5},
        %Poker.Cards{cards: ["2H"], value: 2}
    ]
    """
    @spec two_pair([%Poker.Cards{}]) :: [%Poker.Cards{}]
    def two_pair(analyzed_cards) do
        {pairs, remainder} = Enum.split_with(analyzed_cards, fn c -> length(c.cards) === 2 end)
        case pairs do
            [] -> nil
            [_] -> nil
            [_|_] -> Enum.concat(pairs, remainder)
        end
    end

    @doc """
    Determ the highest three of a kind from analyzed cards
    ## Examples
    iex> Poker.Hand.three_of_a_kind([ %Poker.Cards{cards: ["9C"], value: 9}, %Poker.Cards{cards: ["5S", "5D",], value: 5}, %Poker.Cards{cards: ["3D"], value: 3}, %Poker.Cards{cards: ["2H"], value: 2}])
    nil

    iex> Poker.Hand.three_of_a_kind([ %Poker.Cards{cards: ["5S"], value: 5}, %Poker.Cards{cards: ["QD", "QH", "QS"], value: 12}, %Poker.Cards{cards: ["2H"], value: 2}])
    [
        %Poker.Cards{cards: ["QD", "QH", "QS"], value: 12},
        %Poker.Cards{cards: ["5S"], value: 5},
        %Poker.Cards{cards: ["2H"], value: 2}
    ]
    """
    @spec three_of_a_kind([%Poker.Cards{}]) :: [%Poker.Cards{}]
    def three_of_a_kind(analyzed_cards) do
        {pairs, remainder} = Enum.split_with(analyzed_cards, fn c -> length(c.cards) === 3 end)
        case pairs do
            [] -> nil
            _ -> Enum.concat(pairs, remainder)
        end
    end
end
