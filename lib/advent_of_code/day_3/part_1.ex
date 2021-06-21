defmodule AdventOfCode.Day3.Part1 do
  def forest(nil), do: nil
  def forest(""), do: []

  def forest(input_str) do
    input_str
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.map(fn {col, x} ->
      col
      |> String.graphemes()
      |> Enum.with_index()
      |> Enum.filter(&is_tree?(&1))
      |> Enum.map(fn {_c, y} -> {x, y} end)
      |> IO.inspect(label: "tree")
    end)
    |> Enum.concat()
  end

  def run(forest_input, slope) do
    trees = forest(forest_input)
  end

  defp is_tree?({c, _x}), do: c == "#"
end
