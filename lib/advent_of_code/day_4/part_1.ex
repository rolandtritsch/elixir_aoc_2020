defmodule AdventOfCode.Day4.Part1 do
  alias AdventOfCode.Day4

  @required_fields ["byr", "ecl", "eyr", "iyr", "hcl", "hgt", "pid"]

  def run(path) do
    path
    |> Day4.parse_file()
    |> Enum.filter(&valid_fields?/1)
    |> Enum.count()
  end

  def valid_fields?(record), do: @required_fields -- Map.keys(record) == []
end
