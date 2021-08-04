defmodule AdventOfCode.Day6.Part2 do
  alias AdventOfCode.Day6

  def parse_group(group) do
    group
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&MapSet.new/1)
    |> Enum.reduce(&MapSet.intersection/2)
    |> Enum.count()
  end

  def run(file_path) do
    file_path
    |> Day6.parse_file()
    |> Enum.map(&parse_group/1)
    |> Enum.sum()
  end
end
