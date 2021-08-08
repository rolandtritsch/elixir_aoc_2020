defmodule Custom.Formatter do
  def output(suite) do
    suite
    |> format
    |> IO.write()

    suite
  end

  defp format(suite) do
    Enum.map_join(suite.scenarios, "\n", fn scenario ->
      "#{scenario.job_name}: #{scenario.run_time_data.statistics.average}"
    end)
  end
end

Benchee.run(
  %{
    "AdventOfCode.Day1.Part1.run/1" => fn -> AdventOfCode.Day1.Part1.run("./input/day_01.txt") end,
    "AdventOfCode.Day1.Part2.run/1" => fn -> AdventOfCode.Day1.Part2.run("./input/day_01.txt") end,
    "AdventOfCode.Day2.Part1.run/1" => fn -> AdventOfCode.Day2.Part1.run("./input/day_02.txt") end,
    "AdventOfCode.Day2.Part2.run/1" => fn -> AdventOfCode.Day2.Part2.run("./input/day_02.txt") end,
    "AdventOfCode.Day3.Part1.run/1" => fn -> AdventOfCode.Day3.Part1.run("./input/day_03.txt", {3, 1}) end,
    "AdventOfCode.Day3.Part2.run/1" => fn -> AdventOfCode.Day3.Part2.run("./input/day_03.txt", {3, 1}) end,
  },
  formatters: [&Custom.Formatter.output/1],
  print: [
    benchmarking: false,
    configuration: true,
    fast_warning: false
  ]
)