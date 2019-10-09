# Poker
This is an Interactive Elixir application.

# host locally
```
iex -S mix run
```

# host docker
```
docker run --rm -it johanbosnl/poker:latest
```

# start
```
iex> a = %Poker{name: "Black", cards: ["2H","3D","5S","9C","KD"]}
b = %Poker{name: "White", cards: ["2C","3H","4S","AC","AH"]}
Poker.winner(a, b)
"White wins - pair: ace"
```