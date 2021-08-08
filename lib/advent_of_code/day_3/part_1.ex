defmodule AdventOfCode.Day3.Part1 do
  # inspired by https://github.com/anamba/adventofcode2020/blob/main/lib/day3/part1.ex

  def run(forest_input, slope) when is_tuple(slope) do
    start = {0, 0}
    forest_map = parse_forest(forest_input)
    count_trees(forest_map, start, slope)
  end

  def run(forest_input, slope) when is_list(slope) do
    trees = for s <- slope, do: run(forest_input, s)
    Enum.reduce(trees, fn t, acc -> t * acc end)
  end

  def run(forest_input), do: run(forest_input, {3, 1})

  def count_trees(map, current, slope, count \\ 0)

  def count_trees({_map, _width, height}, {_currentX, currentY}, _, count) when currentY > height,
    do: count

  def count_trees({map, width, height}, {x1, y1}, {x2, y2} = slope, count) do
    {new_x, new_y} = next_coords = {x1 + x2, y1 + y2}
    {map_x, map_y} = {rem(new_x, width), new_y}

    tree =
      case get_in(map, [map_y, map_x]) do
        "#" -> 1
        _ -> 0
      end

    count_trees({map, width, height}, next_coords, slope, count + tree)
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
