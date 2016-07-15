
defmodule Board do
  @moduledoc """
  Board is a module that renders a tic-tac-toe board

  ## examples
    iex> Board.create
    [:empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty]

  """
  @row_length 3

  def create do
    List.duplicate(:empty, 9)
  end

  def place_token(board, position, token) do
    List.replace_at(board, position, token)
  end

  def display(board) do
    board
      |> rows
      |> add_vertical_lines
      |> add_horizontal_lines
      |> List.flatten
      |> transform_cells
      |> Enum.concat(["\n"]) 
      |> Enum.join
  end

  defp rows(board) do
    Enum.chunk(board, @row_length)
  end

  defp add_vertical_lines(board) do
    Enum.map(board, &(Enum.intersperse(&1, "|")))
  end

  defp add_horizontal_lines(board) do
    Enum.intersperse(board, "\n-----------\n")
  end

  defp transform_cells(board) do
    Enum.map(board, &(transform_cell(&1)))
  end

  defp transform_cell(cell) do
    cond do
      cell == :empty -> "   "
      cell == :x -> " #{Atom.to_string(cell)} "
      cell == :o -> " #{Atom.to_string(cell)} "
      true -> cell
    end
  end
end
