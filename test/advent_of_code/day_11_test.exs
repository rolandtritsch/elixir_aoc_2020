defmodule AdventOfCodeTest.Day11Test do
  use ExUnit.Case

  describe "day 10" do
    test "part 1, find occupied seats" do
      assert AdventOfCode.Day11.Part1.run("./input/day_11_test.txt", 10, 10) == 37
      #      assert AdventOfCode.Day11.Part1.run("./input/day_10.txt") == 2210
    end

    test "part 2" do
    end
  end
end
