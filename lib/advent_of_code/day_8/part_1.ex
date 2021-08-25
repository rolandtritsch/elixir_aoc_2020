defmodule AdventOfCode.Day8.Part1 do
  def parse_instruction(instruction_str) do
    %{"inst" => inst, "op" => op, "arg" => arg} =
      Regex.named_captures(~r/(?<inst>\w+) (?<op>(\+?)(\-?))(?<arg>\d+)/, instruction_str)

    {inst, op, String.to_integer(arg)}
  end

  def interpret(code, step \\ 1, acc \\ 0, executed \\ [])

  def interpret(code, step, acc, executed) do
    if step in executed do
      acc
    else
      case code[step] do
        {"acc", op, arg} -> interpret(code, step + 1, accumulate(op, arg, acc), [step | executed])
        {"jmp", op, arg} -> interpret(code, jump(op, arg, step), acc, [step | executed])
        {"nop", _, _} -> interpret(code, step + 1, acc, [step | executed])
      end
    end
  end

  def accumulate(op, arg, acc) do
    case op do
      "+" -> acc + arg
      "-" -> acc - arg
    end
  end

  def jump(op, arg, step) do
    case op do
      "+" -> step + arg
      "-" -> step - arg
    end
  end

  def run(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&parse_instruction/1)
    |> Stream.with_index(1)
    |> Stream.map(fn {elem, index} -> {index, elem} end)
    |> Enum.into(%{})
    |> interpret()
  end
end
