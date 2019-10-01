defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "Starts a poker variant: returns input" do
    Poker.start({"2H","3D","5S","9C","KD"})
    assert Poker.winner() == {"2H","3D","5S","9C","KD"}
  end
end
