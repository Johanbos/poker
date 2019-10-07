defmodule Hand do

    @doc """
    Determ high card.
    iex> Hand.high_card(["2H","3D","5S","9C","KD"])
    "KD"
    """
    def high_card(hand) do
        Enum.max_by(hand, &Card.value/1)
    end

    @doc """
    Determ the highest pair
    iex> Hand.pair(["5H","5D","3S","9C","3D"])
    {5, ["5H", "5D"]}
    iex> Hand.pair(["1H","5D","2S","9C","3D"])
    {0, []}
    """
    def pair(hand) do
        #Grouped cards by value %{2 => ["2H"], 3 => ["3D"], 5 => ["5S", "5D"], 9 => ["9C"]}
        group = Enum.group_by(hand, &Card.value/1)

        #Keep pairs [{5, ["5S", "5D"]}, {3, ["3H", "3D"]}]
        pairs = Enum.filter(group, fn(kv) -> length(elem(kv, 1)) === 2 end)
        if (length(pairs) === 0) do
            {0,[]}
        else
            #Get highest pair[{3, ["3H", "3D"]}, {5, ["5S", "5D"]}]
            lowpairs = Enum.sort_by(pairs, fn(e) -> elem(e, 0) end)
            Enum.at(lowpairs, length(lowpairs)-1)
        end
    end
end
