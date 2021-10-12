defmodule AdventOfCode.Day11.Part1 do
  def run(file_path) do
    file_path
    |> parse_input()
    |> tick_until_stable()
    |> Map.values()
    |> Enum.count(&occupied?/1)
  end

  def parse_input(file_path) do
    grid =
      file_path
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Enum.map(&String.graphemes/1)

    dimensions = {length(grid), length(Enum.at(grid, 0))}
    {rows, cols} = dimensions

    gridMap =
      for row <- 1..rows, col <- 1..cols, into: %{} do
        {{col, row}, Enum.at(grid, row - 1) |> Enum.at(col - 1)}
      end

    {gridMap, dimensions}
  end

  def tick_until_stable({grid, dimensions}) do
    case tick({grid, dimensions}) do
      state when state == grid -> state
      new_state -> tick_until_stable({new_state, dimensions})
    end
  end

  def tick({grid, {rows, cols}}) do
    for row <- 1..rows, col <- 1..cols, into: %{} do
      current_state = Map.get(grid, {col, row})
      {{col, row}, next_state({col, row}, current_state, grid)}
    end
  end

  def next_state(cursor, "L", grid) do
    case Enum.all?(seat_values(cursor, grid), &(!occupied?(&1))) do
      true -> "#"
      _ -> "L"
    end
  end

  def next_state(cursor, "#", grid) do
    case 4 <= Enum.count(seat_values(cursor, grid), &occupied?/1) do
      true -> "L"
      _ -> "#"
    end
  end

  def next_state(_, current_state, _), do: current_state

  def seat_values(cursor, grid) do
    Enum.map(adjacent_seats(cursor), &Map.get(grid, &1))
  end

  def occupied?(seat), do: seat == "#"

  def adjacent_seats({col, row}) do
    [
      {col - 1, row - 1},
      {col, row - 1},
      {col + 1, row - 1},
      {col - 1, row},
      {col + 1, row},
      {col - 1, row + 1},
      {col, row + 1},
      {col + 1, row + 1}
    ]
  end
end
