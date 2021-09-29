defmodule AdventOfCodeTest.Day9Test do
  use ExUnit.Case

  describe "day 9" do
    test "part 1" do
      assert AdventOfCode.Day9.Part1.run("./input/day_09_test.txt", 5) == 127
      assert AdventOfCode.Day9.Part1.run("./input/day_09.txt", 25) == 22_477_624
    end

    test "part 2" do
    end
  end
end
