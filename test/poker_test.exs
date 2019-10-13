defmodule PokerTest do
  use ExUnit.Case, async: true
  doctest Poker
  doctest Poker.Cards
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

  test "Poker winner returns flush Spades" do
    black = %Poker{name: "Black", cards: ["2H","4S","4C","3D","4H"]}
    white = %Poker{name: "White", cards: ["2S","8S","AS","QS","3S"]}
    assert Poker.winner([black, white]) == "White  wins - flush: spades"
  end

  test "Poker winner returns straight" do
    black = %Poker{name: "Black", cards: ["2H","3D","5S","4C","6D"]}
    white = %Poker{name: "White", cards: ["4C","5H","7S","8C","6H"]}
    assert Poker.winner([black, white]) == "White wins - straight: 8"
  end

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
