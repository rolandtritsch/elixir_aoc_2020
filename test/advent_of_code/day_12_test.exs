defmodule AdventOfCodeTest.Day12Test do
  use ExUnit.Case

  describe "day 12" do
    test "part 1" do
      assert AdventOfCode.Day12.Part1.run("./input/day_12_test.txt") == 25
      assert AdventOfCode.Day12.Part1.run("./input/day_12.txt") == 1007
      assert AdventOfCode.Day12.Part1.run("./input/day_12b.txt") == 2297
    end

    test "part 2" do
    end
  end
end
