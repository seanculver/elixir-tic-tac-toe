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
    board = Board.create() |> Board.place_token(4, :x)
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

    assert board == expected_board
  end
  
  test "Cannot override player token on board" do
    board = Board.create() |> Board.place_token(4, :x) |> Board.place_token(4, :o)
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

    assert board == expected_board
  end

  test "Displays an empty board" do
    board = Board.create |> Board.display
    assert board == """
       |   |   
    -----------
       |   |   
    -----------
       |   |   
    """
  end

  test "Displays a board with a token" do
    board = Board.create |> Board.place_token(0, :x) |> Board.display
    assert board == """
     x |   |   
    -----------
       |   |   
    -----------
       |   |   
    """
  end
end
