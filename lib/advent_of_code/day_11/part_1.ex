defmodule AdventOfCode.Day11.Part1 do
  def run(file_path), do: run(file_path, 98, 95)

  def run(file_path, rows, cols) do
    file_path
    |> parse_input(rows, cols)
  end

  def parse_input(file_path, rows, cols) do
    grid =
      file_path
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Enum.map(&String.graphemes/1)

    for row <- 0..(rows - 1), col <- 0..(cols - 1), into: %{} do
      {{row, col}, Enum.at(grid, row) |> Enum.at(col)}
    end
  end

  def tick_until_stable(grid, cols, rows) do
    case tick(grid, rows, cols) do
      state when state == grid -> state
      new_state -> tick_until_stable(new_state, cols, rows)
    end
  end

  def tick(grid, rows, cols) do
    for row <- 0..(rows - 1), col <- 0..(cols - 1), into: %{} do
      current_state = Map.get(grid, {row, col})
      {{row, col}, next_state({row, col}, current_state, grid)}
    end
  end

  def next_state({col, row} = cursor, "L", grid) do
    require IEx
    adjacent_seats(cursor)
    IEx.pry()
  end

  def next_state({col, row}, "#", grid) do
  end

  def next_state(_, current_state, _), do: current_state

  def occupied?(seat), do: seat == "#"

  def adjacent_seats({col, row}) do
    [
      {col - 1, row - 1},
      {col, row - 1},
      {col + 1, row - 1},
      {col - 1, row},
      {col + 1, row + 1},
      {col, row + 1},
      {col + 1, row + 1}
    ]
  end
end
