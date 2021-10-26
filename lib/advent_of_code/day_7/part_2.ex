defmodule AdventOfCode.Day7.Part2 do
  alias AdventOfCode.Day7.Part1

  def count_bags(_bags, []), do: 1

  def count_bags(bags, current) do
    current
    |> Enum.map(fn {c, n} -> count_bags(bags, bags[c]) * n end)
    |> Enum.concat([1])
    |> Enum.sum()
  end

  def run(file_path, start) do
    bags =
      file_path
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Stream.map(&Part1.parse_rule/1)
      |> Enum.into(%{})

    count_bags(bags, bags[start]) - 1
  end
end
