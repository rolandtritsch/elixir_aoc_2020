defmodule AdventOfCode.Day5 do
  def parse_boarding_pass(boarding_pass) do
    for << c <- boarding_pass >> do
      IO.inspect(c)
    end
  end


  def calc_id(row, column) do
    row * 8 + column
  end

  def part1(input_file) do
    input_file
  end
end