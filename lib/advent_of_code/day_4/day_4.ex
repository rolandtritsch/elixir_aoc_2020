defmodule AdventOfCode.Day4 do
  def parse_file(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.chunk_by(&(&1 != ""))
    |> Stream.filter(&(&1 != [""]))
    |> Stream.map(&Enum.join(&1, " "))
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
end
