defmodule AdventOfCode.DayOne.PartTwo do
  def calc(nums) do
    for x <- nums,
        y <- nums,
        z <- nums,
        x + y + z == 2020 do
      x * y * z
    end
  end

  def run do
    case File.read("./input.txt") do
      {:ok, contents} -> process(contents)
      {:error, reason} -> IO.puts("Error: #{reason}")
    end
  end

  def process(contents) when is_binary(contents) do
    contents
    |> String.split()
    |> Enum.map(fn n ->
      {v, _} = Integer.parse(n)
      v
    end)
    |> calc()
    |> Enum.uniq()
    |> List.first
  end
end
