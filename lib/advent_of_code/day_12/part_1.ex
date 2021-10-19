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

  defguard mirror1(action) when action in ["L", "R"]

  defguard mirror2(action, degree)
           when (action == "L" and degree == 90) or (action == "R" and degree == 270)

  defguard mirror3(action, degree)
           when (action == "R" and degree == 90) or (action == "L" and degree == 270)

  def move({"N", value}, {x, y, direction}), do: {x, y + value, direction}
  def move({"S", value}, {x, y, direction}), do: {x, y - value, direction}
  def move({"W", value}, {x, y, direction}), do: {x - value, y, direction}
  def move({"E", value}, {x, y, direction}), do: {x + value, y, direction}

  def move({"F", value}, {x, y, "N"}), do: {x, y + value, "N"}
  def move({"F", value}, {x, y, "E"}), do: {x + value, y, "E"}
  def move({"F", value}, {x, y, "S"}), do: {x, y - value, "S"}
  def move({"F", value}, {x, y, "W"}), do: {x - value, y, "W"}

  def move({action, 180}, {x, y, "N"}) when mirror1(action), do: {x, y, "S"}
  def move({action, 180}, {x, y, "E"}) when mirror1(action), do: {x, y, "W"}
  def move({action, 180}, {x, y, "S"}) when mirror1(action), do: {x, y, "N"}
  def move({action, 180}, {x, y, "W"}) when mirror1(action), do: {x, y, "E"}

  def move({action, degree}, {x, y, "N"}) when mirror2(action, degree), do: {x, y, "W"}
  def move({action, degree}, {x, y, "E"}) when mirror2(action, degree), do: {x, y, "N"}
  def move({action, degree}, {x, y, "S"}) when mirror2(action, degree), do: {x, y, "E"}
  def move({action, degree}, {x, y, "W"}) when mirror2(action, degree), do: {x, y, "S"}

  def move({action, degree}, {x, y, "N"}) when mirror3(action, degree), do: {x, y, "E"}
  def move({action, degree}, {x, y, "E"}) when mirror3(action, degree), do: {x, y, "S"}
  def move({action, degree}, {x, y, "S"}) when mirror3(action, degree), do: {x, y, "W"}
  def move({action, degree}, {x, y, "W"}) when mirror3(action, degree), do: {x, y, "N"}

  # 𝑥=(𝑎,𝑏) 𝑦=(𝑐,𝑑) -> |𝑎−𝑐|+|𝑏−𝑑|
  def manhattan_distance({x1, y1, _}, {x2, y2}) do
    abs(x2 - x1) + abs(y2 - y1)
  end
end
