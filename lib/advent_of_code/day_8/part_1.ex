defmodule AdventOfCode.Day8.Part1 do
  def parse(instruction_str) do
    %{"inst" => inst, "op" => op, "arg" => arg} =
      Regex.named_captures(~r/(?<inst>\w+) (?<op>(\+?)(\-?))(?<arg>\d+)/, instruction_str)

    {inst, op, String.to_integer(arg)}
  end

  def eval(program, step \\ 1, acc \\ 0, executed \\ [])

  def eval(program, step, acc, executed) do
    if step in executed do
      acc
    else
      case program[step] do
        {"acc", op, arg} ->
          eval(program, step + 1, __MODULE__.apply(op, arg, acc), [step | executed])

        {"jmp", op, arg} ->
          eval(program, __MODULE__.apply(op, arg, step), acc, [step | executed])

        {"nop", _, _} ->
          eval(program, step + 1, acc, [step | executed])
      end
    end
  end

  # conflict with Kernel.apply therefore calling as __MODULE__.apply
  def apply(op, arg, acc) do
    case op do
      "+" -> acc + arg
      "-" -> acc - arg
    end
  end

  def run(file_path), do: run(file_path, &eval/1)

  def run(file_path, fun) when is_function(fun) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&parse/1)
    |> Stream.with_index(1)
    |> Stream.map(fn {elem, index} -> {index, elem} end)
    |> Enum.into(%{})
    |> fun.()
  end
end
