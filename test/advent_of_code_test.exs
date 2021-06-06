defmodule AdventOfCodeTest do
  use ExUnit.Case
  alias AdventOfCode.Day1
  alias AdventOfCode.Day2

  test "day 1, part 1 & 2" do
    assert Day1.Part1.run() == 969_024
    assert Day1.Part2.run() == 230_057_040
    assert Day1.Part1.calc([1721, 979, 366, 299, 675, 1456]) == 514_579
    assert Day1.Part1.calc2([1721, 979, 366, 299, 675, 1456]) == 514_579
  end

  test "day 2, part 1" do
    assert Day2.Part1.run() == 625
    assert Day2.Part2.run() == 391
  end
end
