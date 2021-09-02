defmodule AdventOfCode.Day8.Part2 do
  alias AdventOfCode.Day8.Part1

  def eval_2(program, step \\ 1, acc \\ 0, executed \\ [], jumped \\ [], noped \\ [])

  def eval_2(program, step, acc, executed, jumped, noped) do
    IO.inspect(program, label: :code)
    if step in executed do
      acc
    else
      case program[step] do
        {"acc", op, arg} ->
          eval_2(program, step + 1, Part1.apply(op, arg, acc), [step | executed])

        {"jmp", op, arg} ->
          new_line = put_elem(program[step], 0, "nop")
          new_code = Map.put(program, step, new_line)
          eval_2(new_code, step, acc, [step | executed])

        {"nop", op, arg} ->
          new_line = put_elem(program[step], 0, "jpm")
          new_code = Map.put(program, step, new_line)
          eval_2(new_code, Part1.apply(op, arg, step), acc, [step | executed])
      end
    end
  end

  def run(file_path) do
    file_path
    |> Part1.run(&eval_2/1)
  end
end
