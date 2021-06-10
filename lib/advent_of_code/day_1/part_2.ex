defmodule AdventOfCode.Day1.Part2 do
  def calc2(nums) do
    [w, x, y | rest] = nums

    pairs1 =
      rest
      |> Enum.map(fn y -> {w, x, y} end)

    pairs2 =
      rest
      |> Enum.map(fn z -> {x, y, z} end)

    pair = pairs1 ++ pairs2
      |> Enum.find(fn {x, y, z} -> x + y + z == 2020 end)

    case is_tuple(pair) do
      true -> multiply(pair)
      _ -> nil
    end
  end

  defp multiply({x, y}), do: x * y
  defp multiply({x, y, z}), do: x * y * z

  def calc(nums) do
    for x <- nums,
        y <- nums,
        z <- nums,
        x + y + z == 2020 do
      x * y * z
    end
  end

  def run do
    case File.read("./input/day_01.txt") do
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
    |> List.first()
  end
end
