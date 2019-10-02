defmodule HighCard do
  @moduledoc """
  Determs the hand value based on a High Card.
  """

  @doc """
  Determ HighCard value.

  ## Examples
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
            "J" -> 10
            "Q" -> 11
            "K" -> 12
            "A" -> 13
        end
    end
  end

  @doc """
  Determ HighCard card.

  ## Examples
      iex> HighCard.card(["2H","3D","5S","9C","KD"])
      "KD"
  """
  def card(hand) do
    Enum.max_by(hand, &value/1)
  end
end
