defmodule AdventOfCode.Day10.Part1 do
  def run(file_path) do
    file_path
    |> parse_input()
    |> find_jolt_diff()
  end

  def find_jolt_diff(jolts) do
    {_position, ones, threes} =
      jolts
      |> Enum.reduce({0, 0, 0}, fn val, {current, ones, threes} ->
        case val - current do
          1 -> {val, ones + 1, threes}
          3 -> {val, ones, threes + 1}
        end
      end)

    ones * (threes + 1)
  end

  def parse_input(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.sort()
  end
end
