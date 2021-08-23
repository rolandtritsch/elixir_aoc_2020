defmodule AdventOfCode.Day8.Part1 do
  def parse_instruction(instruction_str) do
    %{"instr" => instr, "op" => op, "arg" => arg} =
      Regex.named_captures(~r/(?<instr>\w+) (?<op>(\+?)(\-?))(?<arg>\d+)/, instruction_str)

    {instr, op, String.to_integer(arg)}
  end

  def run(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&parse_instruction/1)
    |> Enum.into([])
  end
end
