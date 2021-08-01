defmodule AdventOfCode.Day6 do
  def parse_file(path_file) do
    path_file
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.chunk_by(&(&1 == ""))
  end
end
