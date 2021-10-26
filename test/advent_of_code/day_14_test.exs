defmodule AdventOfCodeTest.Day14Test do
  use ExUnit.Case

  describe "day 14" do
    test "part 1" do
      assert AdventOfCode.Day14.Part1.run("./input/day_14_test.txt") == 165
      assert AdventOfCode.Day14.Part1.run("./input/day_14.txt") == 4_886_706_177_792
    end

    test "part 2" do
    end
  end
end
