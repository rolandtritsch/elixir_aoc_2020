defmodule AdventOfCode.Day2.Part1 do
  def run(file_path) do
    case File.read(file_path) do
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

    check = count_chars(pass, char)

    check >= min and check <= max
  end

  defp count_chars(password, char) do
    password
    |> String.graphemes()
    |> Enum.filter(&(&1 == char))
    |> Enum.count()
  end
end
