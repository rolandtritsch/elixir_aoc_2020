defmodule AdventOfCodeTest.Day1Test do
  use ExUnit.Case

  describe "day 1" do
    test "part 1 & 2" do
      assert AdventOfCode.Day1.Part1.run("./input/day_01.txt") == 969_024
      assert AdventOfCode.Day1.Part2.run("./input/day_01.txt") == 230_057_040
      assert AdventOfCode.Day1.Part1.calc([1721, 979, 366, 299, 675, 1456]) == 514_579
      assert AdventOfCode.Day1.Part1.calc2([1721, 979, 366, 299, 675, 1456]) == 514_579
      assert AdventOfCode.Day1.Part2.calc2([1721, 979, 366, 299, 675, 1456]) == 241_861_950
    end
  end
end
