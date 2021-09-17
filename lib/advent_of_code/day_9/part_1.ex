defmodule AdventOfCode.Day9.Part1 do
  def run(file_path, preamble_length) do
    file_path
    |> parse_input()
    |> Stream.chunk_every(preamble_length + 1, 1)
    |> Stream.filter(&(!sum_of_previous_two_nums?(&1)))
    |> Enum.take(1)
    |> List.first()
    |> Enum.reverse()
    |> List.first()
  end

  def sum_of_previous_two_nums?(nums) do
    [target | rest] = Enum.reverse(nums)

    case find_pair(target, rest) do
      {:ok, _} -> true
      _ -> false
    end
  end

  def find_pair(_target, []), do: :not_found

  def find_pair(target, [i | rest]) do
    if (target - i) in rest do
      {:ok, i}
    else
      find_pair(target, rest)
    end
  end

  def parse_input(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end
end
