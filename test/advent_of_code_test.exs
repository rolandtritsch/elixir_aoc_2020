defmodule AdventOfCodeTest do
  use ExUnit.Case
  alias AdventOfCode.Day1
  alias AdventOfCode.Day2

  test "day 1, part 1 & 2" do
    assert Day1.Part1.run() == 969_024
    assert Day1.Part2.run() == 230_057_040
    assert Day1.Part1.calc([1721, 979, 366, 299, 675, 1456]) == 514_579
    assert Day1.Part1.calc2([1721, 979, 366, 299, 675, 1456]) == 514_579
    assert Day1.Part2.calc2([1721, 979, 366, 299, 675, 1456]) == 241_861_950
  end

  test "day 2, part 1" do
    assert Day2.Part1.run() == 625
    assert Day2.Part2.run() == 391
  end

  test "day 3, part 1 & 2" do
    assert AdventOfCode.Day3.Part1.run("./input/day_03.txt", {3, 1}) == 153

    trees =
      for slope <- [{3, 1}, {1, 1}, {5, 1}, {7, 1}, {1, 2}],
          do: AdventOfCode.Day3.Part2.run("./input/day_03.txt", slope)

    assert Enum.reduce(trees, fn t, acc -> t * acc end) == 2_421_944_712
  end
end
