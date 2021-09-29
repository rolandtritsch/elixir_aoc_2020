defmodule AdventOfCodeTest.Day2Test do
  use ExUnit.Case

  describe "day 2" do
    test "part 1 & 2" do
      assert AdventOfCode.Day2.Part1.run("./input/day_02.txt") == 625
      assert AdventOfCode.Day2.Part2.run("./input/day_02.txt") == 391
    end
  end
end
