defmodule Poker.Cards do
  defstruct [:cards, :value]
  @jack 10
  @queen 11
  @king 12
  @ace 13

  @doc """
  Transform cards into an analyzed cards, grouping and ranking cards
  ## Examples
    iex> Poker.Cards.analyze(["2H","3D","5S","9C","5D"])
    [
      %Poker.Cards{cards: ["9C"], value: 9},
      %Poker.Cards{cards: ["5S", "5D"], value: 5},
      %Poker.Cards{cards: ["3D"], value: 3},
      %Poker.Cards{cards: ["2H"], value: 2}
    ]

    iex> Poker.Cards.analyze(["AH","QD","QS","QC","KD"])
    [
        %Poker.Cards{cards: ["AH"], value: 13},
        %Poker.Cards{cards: ["KD"], value: 12},
        %Poker.Cards{cards: ["QD", "QS", "QC"], value: 11}
    ]
  """
  @spec analyze([String]) :: [%Poker.Cards{}]
  def analyze(hand) do
    Enum.group_by(hand, &Poker.Cards.value/1)
    |> Enum.sort_by(fn e -> elem(e, 0) * -1 end)
    |> Enum.map(fn c -> %Poker.Cards{value: elem(c, 0), cards: elem(c, 1)} end)
  end

  @doc """
  Determ Card value.
  ## Examples
    iex> Poker.Cards.value("2H")
    2
    iex> Poker.Cards.value("KD")
    12
    iex> Poker.Cards.value("6D")
    6
    iex> Poker.Cards.value("QD")
    11
  """
  @spec value(String.t()) :: integer
  def value(card) do
    f = String.first(card)

    case Integer.parse(f) do
      {n, ""} -> n
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
  iex> Poker.Cards.name("KD")
  "king"
  iex> Poker.Cards.name("9C")
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

  @doc """
  Determ Card suit.
  ## Examples
  iex> Poker.Cards.suit("KD")
  "diamond"
  iex> Poker.Cards.suit("9C")
  "club"
  iex> Poker.Cards.suit("9H")
  "heart"
  iex> Poker.Cards.suit("9S")
  "spades"
  """
  @spec suit(String.t()) :: String.t()
  def suit(card) do
    s = String.at(card, 1)
    case s do
        "S" -> "spades"
        "H" -> "heart"
        "D" -> "diamond"
        "C" -> "club"
    end
  end
end
