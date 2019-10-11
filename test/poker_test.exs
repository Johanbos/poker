defmodule PokerTest do
  use ExUnit.Case, async: true
  doctest Poker
  doctest Poker.Card
  doctest Poker.Hand

  test "Poker winner returns Ace" do
    black = %Poker{name: "Black", cards: ["2H","3D","5S","9C","KD"]}
    white = %Poker{name: "White", cards: ["2C","3H","4S","8C","AH"]}
    assert Poker.winner([black, white]) == "White wins - high card: ace"
  end

  test "Poker winner returns pair Ace" do
    black = %Poker{name: "Black", cards: ["2H","3D","5S","9C","KD"]}
    white = %Poker{name: "White", cards: ["2C","3H","4S","AC","AH"]}
    assert Poker.winner([black, white]) == "White wins - pair: ace"
  end

#todo: flush
#Input: Black: 2H 4S 4C 3D 4H White: 2S 8S AS QS 3S
#Output: White wins - flush

#todo: have same pair, win on high card

  test "Poker winner returns 9" do
    black = %Poker{name: "Black", cards: ["2H","3D","5S","9C","6D"]}
    white = %Poker{name: "White", cards: ["2C","3H","4S","8C","6H"]}
    assert Poker.winner([black, white]) == "Black wins - high card: 9"
  end

  test "Poker winner returns Tie" do
    black = %Poker{name: "Black", cards: ["2H","3D","5S","9C","KD"]}
    white = %Poker{name: "White", cards: ["2D","3H","5C","9S","KH"]}
    assert Poker.winner([black, white]) == "Tie"
  end

end
