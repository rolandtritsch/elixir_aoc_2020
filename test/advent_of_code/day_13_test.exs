defmodule AdventOfCodeTest.Day13Test do
  use ExUnit.Case

  describe "day 13" do
    test "part 1" do
      assert AdventOfCode.Day13.Part1.run("./input/day_13_test.txt") == 295
      assert AdventOfCode.Day13.Part1.run("./input/day_13.txt") == 2935
    end

    test "part 2" do
    end
  end
end
