defmodule Benchmarks do
  def timed(module, fun, args) do
    {time, result} = :timer.tc(module, fun, args)
    IO.puts("#{module}.#{fun} => {#{result}, #{time |> to_seconds() }s}")
  end

  defp to_seconds(ms), do: ms / 1_000_000
end

Benchmarks.timed(AdventOfCode.Day1.Part1, :run, ["./input/day_01.txt"])
Benchmarks.timed(AdventOfCode.Day1.Part2, :run, ["./input/day_01.txt"])

Benchmarks.timed(AdventOfCode.Day2.Part1, :run, ["./input/day_02.txt"])
Benchmarks.timed(AdventOfCode.Day2.Part2, :run, ["./input/day_02.txt"])

Benchmarks.timed(AdventOfCode.Day3.Part1, :run, ["./input/day_03.txt", {3, 1}])
Benchmarks.timed(AdventOfCode.Day3.Part2, :run, ["./input/day_03.txt", [{3, 1}, {1, 1}, {5, 1}, {7, 1}, {1, 2}]])

Benchmarks.timed(AdventOfCode.Day4.Part1, :run, ["./input/day_04.txt"])
Benchmarks.timed(AdventOfCode.Day4.Part2, :run, ["./input/day_04.txt"])

Benchmarks.timed(AdventOfCode.Day5.Part1, :run, ["./input/day_05.txt"])
Benchmarks.timed(AdventOfCode.Day5.Part2, :run, ["./input/day_05.txt"])

Benchmarks.timed(AdventOfCode.Day6.Part1, :run, ["./input/day_06.txt"])
Benchmarks.timed(AdventOfCode.Day6.Part2, :run, ["./input/day_06.txt"])

Benchmarks.timed(AdventOfCode.Day7.Part1, :run, ["./input/day_07.txt", "shiny gold"])


