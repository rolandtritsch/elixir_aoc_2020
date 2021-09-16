defmodule AdventOfCode.Day9.Part1 do
  def unmask(mask, preamble_length) do
    require IEx
    [preamble | rest] = Enum.chunk_every(mask, preamble_length)

    IEx.pry()
#    sums = compute(preamble)
    find_weakness(sums, rest)
  end

  def find_weakness(preamble, rest) do
    preamble

    #    Enum.reduce_while(rest, fn {x, acc} ->
    #      acc |> Enum.chunk_every(preamble)
    #    end)
  end

  def compute(preamble, sums \\ [])

  def compute(preamble, sums) do
    [x, y | rest] = preamble
    compute(rest, [x + y | sums])
  end

  def compute([], sums), do: sums

  def run(file_path, preamble_length), do: run(file_path, &unmask/2, preamble_length)

  def run(file_path, fun, preamble_length) when is_function(fun) do
    file_path
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> fun.(preamble_length)
  end
end
