defmodule AdventOfCode.Day2.Part2 do
  def run do
    case File.read("./input/day_02.txt") do
      {:ok, contents} -> process(contents)
      {:error, reason} -> IO.puts("Error: #{reason}")
    end
  end

  defp process(contents) do
    contents
    |> String.split()
    |> Enum.chunk_every(3)
    |> Enum.map(&password_check/1)
    |> Enum.count(&(&1 == true))
  end

  defp password_check([len, char, pass]) do
    [min, max] =
      len
      |> String.split("-")
      |> Enum.map(&String.to_integer/1)

    [char, _] = String.split(char, ":")

    char_list = String.graphemes(pass)
    first_match = char == Enum.at(char_list, min - 1)
    second_match = char == Enum.at(char_list, max - 1)

    (first_match and !second_match) or (!first_match and second_match)
  end
end
