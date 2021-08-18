defmodule Custom.Formatter do
  def output(suite) do
    suite
    |> format
    |> IO.write()

    suite
  end

  defp format(suite) do
    Enum.map_join(suite.scenarios, "\n", fn scenario ->
      "#{scenario.job_name}: #{scenario.run_time_data.statistics.average |> to_seconds() }"
    end)
  end

  defp to_seconds(ms), do: ms / 1_000_000
end

Benchee.run(
  %{
    "AdventOfCode.Day1.Part1.run/1" => fn -> AdventOfCode.Day1.Part1.run("./input/day_01.txt") end,
    "AdventOfCode.Day1.Part2.run/1" => fn -> AdventOfCode.Day1.Part2.run("./input/day_01.txt") end,
    "AdventOfCode.Day2.Part1.run/1" => fn -> AdventOfCode.Day2.Part1.run("./input/day_02.txt") end,
    "AdventOfCode.Day2.Part2.run/1" => fn -> AdventOfCode.Day2.Part2.run("./input/day_02.txt") end,
    "AdventOfCode.Day3.Part1.run/2" => fn -> AdventOfCode.Day3.Part1.run("./input/day_03.txt", {3, 1}) end,
    "AdventOfCode.Day3.Part2.run/2" => fn -> AdventOfCode.Day3.Part2.run("./input/day_03.txt", [{3, 1}, {1, 1}, {5, 1}, {7, 1}, {1, 2}]) end,
    "AdventOfCode.Day4.Part1.run/1" => fn -> AdventOfCode.Day4.Part1.run("./input/day_04.txt") end,
    "AdventOfCode.Day4.Part2.run/1" => fn -> AdventOfCode.Day4.Part2.run("./input/day_04.txt") end,
    "AdventOfCode.Day5.Part1.run/1" => fn -> AdventOfCode.Day5.Part1.run("./input/day_05.txt") end,
    "AdventOfCode.Day5.Part2.run/1" => fn -> AdventOfCode.Day5.Part2.run("./input/day_05.txt") end,
    "AdventOfCode.Day6.Part1.run/1" => fn -> AdventOfCode.Day6.Part1.run("./input/day_06.txt") end,
    "AdventOfCode.Day6.Part2.run/1" => fn -> AdventOfCode.Day6.Part2.run("./input/day_06.txt") end,

  },
  formatters: [&Custom.Formatter.output/1],
  print: [
    benchmarking: false,
    configuration: true,
    fast_warning: false
  ]
)