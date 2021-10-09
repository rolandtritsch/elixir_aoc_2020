defmodule AdventOfCodeTest.Day11Test do
  use ExUnit.Case

  describe "day 11" do
    test "part 1, find occupied seats" do
      assert AdventOfCode.Day11.Part1.run("./input/day_11_test.txt") == 37
      assert AdventOfCode.Day11.Part1.run("./input/day_11.txt") == 2412
      assert AdventOfCode.Day11.Part1.run("./input/day_11b.txt") == 2289
    end

    test "part 2" do
    end
  end
end
