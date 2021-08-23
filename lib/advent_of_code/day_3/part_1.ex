defmodule AdventOfCode.Day3.Part1 do
  # inspired by https://github.com/anamba/adventofcode2020/blob/main/lib/day3/part1.ex
  def run(input), do: run(input, {3, 1})

  def run(input, slope) do
    start = {0, 0}
    forest = parse_forest(input)
    count_trees(forest, start, slope)
  end

  def count_trees(forest, current, slope, count \\ 0)

  def count_trees(
    {_forest_map, _forest_width, forest_height},
    {_current_col, current_row},
    _slope,
    count
  ) when current_row > forest_height do
    count
  end

  def count_trees(
    {forest_map, forest_width, _forest_height} = forest,
    {current_col, current_row},
    {delta_col, delta_row} = slope,
    count
  ) do
    next_current = {rem(current_col + delta_col, forest_width), current_row + delta_row}
    next_count = count + tree_count(forest_map, next_current)

    count_trees(forest, next_current, slope, next_count)
  end

  defp tree_count(map, {col, row}) do
    if get_in(map, [row, col]) == "#", do: 1, else: 0
  end

  defp parse_forest(file_path) do
    forest_map =
      file_path
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Enum.with_index()
      |> Enum.map(fn {line, index} ->
        {index,
         line
         |> String.graphemes()
         |> Enum.with_index()
         |> Enum.map(fn {char, index} -> {index, char} end)
         |> Enum.into(%{})}
      end)
      |> Enum.into(%{})

    width = map_size(forest_map[0])
    height = map_size(forest_map)
    {forest_map, width, height}
  end
end
