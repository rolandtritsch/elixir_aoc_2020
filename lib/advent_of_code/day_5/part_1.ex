defmodule AdventOfCode.Day5.Part1 do
  alias AdventOfCode.Day5

  def parse_boarding_pass(boarding_pass) do
    boarding_pass
    |> String.graphemes()
    |> Enum.map(fn
      "B" -> 1
      "F" -> 0
      "R" -> 1
      "L" -> 0
    end)
    |> calc_id()
  end

  def calc_id(binary_number) do
    {row, column} =
      binary_number
      |> Enum.split(7)

    binary_to_decimal(row) * 8 + binary_to_decimal(column)
  end

  def binary_to_decimal(list_of_1_and_0) do
    list_of_1_and_0
    |> Enum.join()
    |> String.to_integer(2)
  end

  def run(input_file) do
    input_file
    |> Day5.parse_file()
    |> Enum.map(&parse_boarding_pass/1)
    |> IO.inspect()
  end
end
