defmodule AdventOfCode.Day4.Part1 do
  @required_fields ["byr", "ecl", "eyr", "iyr", "hcl", "hgt", "pid"]

  def parse_file(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.chunk_by(&(&1 != ""))
    |> Stream.filter(&(&1 != [""]))
    |> Stream.map(&Enum.join(&1, " "))
    #    |> Enum.take(2)
    |> Enum.map(&parse_line/1)
  end

  def parse_line(line) do
    line
    |> String.split()
    |> Enum.map(fn record ->
      [field, value] = String.split(record, ":")
      {field, value}
    end)
    |> Enum.into(%{})
  end

  def run(path) do
    path
    |> parse_file()
    |> Enum.filter(&valid_record?/1)
    |> Enum.count()
  end

  def valid_record?(record), do: @required_fields -- Map.keys(record) == []
end
