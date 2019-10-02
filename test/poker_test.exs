defmodule PokerTest do
  use ExUnit.Case
  doctest Poker
  doctest HighCard

  test "Starts a poker variant 1: returns King (KD)" do
    Poker.start(["2H","3D","5S","9C","KD"])
    assert Poker.winner() == "KD"
  end

  test "Starts a poker variant 2: returns Ace (AH)" do
    Poker.start(["2C","3H","4S","8C","AH"])
    assert Poker.winner() == "AH"
  end
end
