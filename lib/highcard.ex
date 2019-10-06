defmodule HighCard do
  @moduledoc """
    Determs the hand value based on a High Card.
  """
  @jack 10
  @queen 12
  @king 12
  @ace 13

  @doc """
  Determ HighCard value.

  iex> HighCard.value("2H")
  2
  iex> HighCard.value("KD")
  12
  """
  def value(card) do
    f = String.first(card)
    case Integer.parse(f) do
        {n, ""} -> n
        _ -> case f do
            "J" -> @jack
            "Q" -> @queen
            "K" -> @king
            "A" -> @ace
        end
    end
  end

  @doc """
  Determ HighCard name.

  iex> HighCard.name("2H")
  2
  iex> HighCard.name("KD")
  "king"
  """
  def name(card) do
    f = String.first(card)
    case Integer.parse(f) do
        {n, ""} -> n
        _ -> case f do
            "J" -> "jack"
            "Q" -> "queen"
            "K" -> "king"
            "A" -> "ace"
        end
    end
  end

  @doc """
  Determ HighCard card.
    iex> HighCard.card(["2H","3D","5S","9C","KD"])
    "KD"
  """
  def card(hand) do
    Enum.max_by(hand, &value/1)
  end
end
