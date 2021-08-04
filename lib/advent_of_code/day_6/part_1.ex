defmodule AdventOfCode.Day6.Part1 do
  alias AdventOfCode.Day6

  def parse_group(group) do
    group
    |> Stream.map(&Enum.join/1)
    |> Stream.map(&String.graphemes/1)
    |> Stream.map(&Enum.frequencies/1)
    |> Stream.map(&map_size/1)
    |> Enum.sum()
  end

  def run(file_path) do
    file_path
    |> Day6.parse_file()
    |> parse_group()
  end
end
