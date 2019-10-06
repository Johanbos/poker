defmodule PokerTest do
  use ExUnit.Case
  doctest Poker
  doctest HighCard

  test "Starts a poker variant 1: returns Ace" do
    black = %Poker{name: "Black", hand: ["2H","3D","5S","9C","KD"]}
    white = %Poker{name: "White", hand: ["2C","3H","4S","8C","AH"]}
    assert Poker.winner(black, white) == "White wins - high card: ace"
  end

#Input: Black: 2H 4S 4C 3D 4H White: 2S 8S AS QS 3S
#Output: White wins - flush

#Input: Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C KH
#Output: Black wins - high card: 9

#Input: Black: 2H 3D 5S 9C KD White: 2D 3H 5C 9S KH
#Output: Tie

end
