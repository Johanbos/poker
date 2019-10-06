defmodule Card do
  @jack 10
  @queen 12
  @king 12
  @ace 13

  @doc """
  Determ Card value.

  iex> Card.value("2H")
  2
  iex> Card.value("KD")
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
  Determ Card name.

  iex> Card.name("2H")
  2
  iex> Card.name("KD")
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
end
