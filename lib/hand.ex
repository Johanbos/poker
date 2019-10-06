defmodule Hand do

    @doc """
    Determ high card.
    iex> Poker.high_card(["2H","3D","5S","9C","KD"])
    "KD"
    """
    def high_card(hand) do
        Enum.max_by(hand, &Card.value/1)
    end
end
