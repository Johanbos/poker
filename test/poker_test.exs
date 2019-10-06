defmodule PokerTest do
  use ExUnit.Case
  doctest Poker
  doctest HighCard

  test "Starts a poker variant 1: returns Ace" do
    assert Poker.winner(["2H","3D","5S","9C","KD"], ["2C","3H","4S","8C","AH"]) == "White wins - high card: AH"
  end
end
