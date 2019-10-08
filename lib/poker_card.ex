defmodule Poker.Card do
  defstruct [:value, :cards]
  @jack 10
  @queen 12
  @king 12
  @ace 13

  @doc """
  Transform cards into an analyzed cards, grouping and ranking cards
  ## Examples
    iex> Poker.Card.analyze(["2H","3D","5S","9C","5D"])
    [
      %Poker.Card{cards: ["9C"], value: 9},
      %Poker.Card{cards: ["5S", "5D"], value: 5},
      %Poker.Card{cards: ["3D"], value: 3},
      %Poker.Card{cards: ["2H"], value: 2}
    ]

    iex> Poker.Card.analyze(["2H","3D","5S","9C","6D"])
    [
      %Poker.Card{cards: ["9C"], value: 9},
      %Poker.Card{cards: ["6D"], value: 6},
      %Poker.Card{cards: ["5S"], value: 5},
      %Poker.Card{cards: ["3D"], value: 3},
      %Poker.Card{cards: ["2H"], value: 2}
    ]
  """
  def analyze(hand) do
    Enum.group_by(hand, &Poker.Card.value/1)
    |> Enum.sort_by(fn e -> elem(e, 0) * -1 end)
    |> Enum.map(fn c -> %Poker.Card{value: elem(c, 0), cards: elem(c, 1)} end)
  end

  @doc """
  Determ Card value.
  ## Examples
    iex> Poker.Card.value("2H")
    2
    iex> Poker.Card.value("KD")
    12
    iex> Poker.Card.value("6D")
    6
  """
  @spec value(String.t()) :: integer
  def value(card) do
    f = String.first(card)

    case Integer.parse(f) do
      {n, ""} ->
        n

      _ ->
        case f do
          "J" -> @jack
          "Q" -> @queen
          "K" -> @king
          "A" -> @ace
        end
    end
  end

  @doc """
  Determ Card name.
  ## Examples
  iex> Poker.Card.name("KD")
  "king"
  iex> Poker.Card.name("9C")
  "9"
  """
  @spec name(String.t()) :: String.t()
  def name(card) do
    f = String.first(card)
    case Integer.parse(f) do
      {_n, ""} -> f
      _ ->
        case f do
          "J" -> "jack"
          "Q" -> "queen"
          "K" -> "king"
          "A" -> "ace"
        end
    end
  end
end
