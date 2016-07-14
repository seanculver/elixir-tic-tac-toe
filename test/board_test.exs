defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "Creates an empty board" do
    assert Board.create() == [
      :empty,
      :empty,
      :empty,
      :empty,
      :empty,
      :empty,
      :empty,
      :empty,
      :empty
    ]
  end

  test "Can place player token on board" do
    token = :x
    position = 4
    board = Board.create()
    expected_board = [
      :empty,
      :empty,
      :empty,
      :empty,
      :x,
      :empty,
      :empty,
      :empty,
      :empty
    ]

    assert Board.place_token(board, position, token) == expected_board
  end

  test "Displays empty board" do
    board = Board.create |> Board.display
    assert board == "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   "
  end

  test "Displays a board with a token" do
    board = Board.create |> Board.place_token(0, :x) |> Board.display
    assert board == " x |   |   \n-----------\n   |   |   \n-----------\n   |   |   "
  end
end
