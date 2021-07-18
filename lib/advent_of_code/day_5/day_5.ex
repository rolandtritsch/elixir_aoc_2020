defmodule AdventOfCode.Day5 do
  def parse_file(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.split(&1, "\n", trim: true))
    |> Enum.to_list()
    |> List.flatten()
  end
end
