defmodule AdventOfCodeTest.Day10Test do
  use ExUnit.Case

  describe "day 10" do
    test "part 1" do
      assert AdventOfCode.Day10.Part1.run("./input/day_10_test.txt") == 220
      assert AdventOfCode.Day10.Part1.run("./input/day_10.txt") == 2210
    end

    test "part 2" do
    end
  end
end
