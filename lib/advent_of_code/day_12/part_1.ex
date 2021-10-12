defmodule AdventOfCode.Day12.Part1 do
  def run(file_path) do
    file_path
    |> parse_input()
  end

  def parse_input(file_path) do
      file_path
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Enum.map(&parse_action/1)
      |> Enum.reduce({0, 0, "E"}, &move/2)
      |> manhattan_distance({0, 0})
  end

  def parse_action("N" <> value) when is_binary(value), do: {"N", String.to_integer(value)}
  def parse_action("S" <> value) when is_binary(value), do: {"S", String.to_integer(value)}
  def parse_action("E" <> value) when is_binary(value), do: {"E", String.to_integer(value)}
  def parse_action("W" <> value) when is_binary(value), do: {"W", String.to_integer(value)}
  def parse_action("L" <> value) when is_binary(value), do: {"L", String.to_integer(value)}
  def parse_action("R" <> value) when is_binary(value), do: {"R", String.to_integer(value)}
  def parse_action("F" <> value) when is_binary(value), do: {"F", String.to_integer(value)}

  def move({"N", value}, {x, y, direction}), do: {x, y + value, direction}
  def move({"S", value}, {x, y, direction}), do: {x, y - value, direction}
  def move({"W", value}, {x, y, direction}), do: {x - value, y, direction}
  def move({"E", value}, {x, y, direction}), do: {x + value, y, direction}

  def move({"F", value}, {x, y, direction}), do: move({direction, value}, {x, y, direction})

  # inspiration for this direction algorithm
  # https://github.com/anamba/adventofcode2020/blob/main/lib/day12/part1.ex
  @directions ["N", "E", "S", "W"]
  def move({"L", value}, {x, y, direction}) do
    delta = div(value, 90)
    direction_index = Enum.find_index(@directions, &(&1 == direction))
    new_direction = Enum.at(@directions, rem(direction_index - delta, 4))
    {x, y, new_direction}
  end

  def move({"R", value}, {x, y, direction}) do
    delta = div(value, 90)
    direction_index = Enum.find_index(@directions, &(&1 == direction))
    new_direction = Enum.at(@directions, rem(direction_index + delta, 4))
    {x, y, new_direction}
  end

  # 𝑥=(𝑎,𝑏) 𝑦=(𝑐,𝑑) -> |𝑎−𝑐|+|𝑏−𝑑|
  def manhattan_distance({x1, y1, _}, {x2, y2}) do
    abs(x2 - x1) + abs(y2 - y1)
  end
end
