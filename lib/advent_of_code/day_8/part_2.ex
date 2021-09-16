defmodule AdventOfCode.Day8.Part2 do
  alias AdventOfCode.Day8.Part1

  def rewrite(program) do
    program
    |> Enum.map(fn {k, line} ->
      case line do
        {"jmp", _, _} ->
          put_elem(line, 0, "nop")

        {"jmp", _, 0} ->
          put_elem(line, 0, "nop")

        {"nop", _, _} ->
          put_elem(line, 0, "jmp")

        _ ->
          line
      end
    end)
    |> Stream.with_index(1)
    |> Stream.map(fn {elem, index} -> {index, elem} end)
    |> Enum.into(%{})
  end

  def eval(program, step \\ 1, acc \\ 0, executed \\ [])

  def eval(program, step, acc, executed) do
    IO.inspect(executed, label: "executed")

    if step in executed do
      acc
    else
      case program[step] do
        {"acc", op, arg} ->
          eval(program, step + 1, Part1.apply(op, arg, acc), [step | executed])

        {"jmp", op, arg} ->
          eval(program, Part1.apply(op, arg, step), acc, [step | executed])

        {"nop", _, _} ->
          eval(program, step + 1, acc, [step | executed])
      end
    end
  end

  def run(file_path) do
    file_path
    |> Part1.run(&rewrite/1)
    |> IO.inspect(label: :new_program)
    |> eval()
  end
end
