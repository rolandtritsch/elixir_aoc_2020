defmodule AdventOfCode.Day1.Part1 do
  #  A more optimal solution using the commutative property
  #  t/h @rolandtritsch
  def calc2(nums) do
    [x | rest] = nums

    pairs =
      rest
      |> Enum.map(fn y -> {x, y} end)

    pair =
      pairs
      |> Enum.find(fn {x, y} -> x + y == 2020 end)

    case is_tuple(pair) do
      true -> multiply(pair)
      _ -> nil
    end
  end

  defp multiply({x, y}), do: x * y

  # suboptimal solution: makes all possible combinations
  # aka without commutative property
  def calc(nums) do
    pair =
      for x <- nums,
          y <- nums,
          x + y == 2020 do
        x * y
      end

    pair
    |> Enum.uniq()
    |> List.first()
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
  end
end
