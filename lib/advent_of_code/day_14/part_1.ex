defmodule AdventOfCode.Day14.Part1 do
  def run(file_path) do
    file_path
    |> parse_input()
    |> evaluate()
    |> elem(0)
    |> Map.values()
    |> Enum.sum()
  end

  def evaluate(instructions) do
    Enum.reduce(instructions, {%{}, ""}, &evaluate_instruction/2)
  end

  def evaluate_instruction({:mask, new_mask}, {memory, _mask}) do
    {memory, new_mask}
  end

  def evaluate_instruction({:mem, addr, value}, {memory, mask}) do
    {Map.put(memory, addr, apply_mask(mask, value)), mask}
  end

  def apply_mask(mask, value) do
    binary = Integer.digits(value, 2) |> Enum.reverse()

    for {binary_mask, i} <- Enum.with_index(mask) do
      case binary_mask do
        "1" -> 1
        "0" -> 0
        "X" -> Enum.at(binary, i) || 0
      end
    end
    |> Enum.reverse()
    |> Integer.undigits(2)
  end

  def parse_input(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.map(&parse_line/1)
  end

  def parse_line("mask = " <> mask_str) do
    mask =
      mask_str
      |> String.graphemes()
      |> Enum.reverse()

    {:mask, mask}
  end

  def parse_line("mem[" <> memory_str) do
    {addr, rest} = Integer.parse(memory_str)
    "] = " <> value_str = rest
    {:mem, addr, String.to_integer(value_str)}
  end
end
