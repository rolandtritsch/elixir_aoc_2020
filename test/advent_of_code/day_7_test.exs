defmodule AdventOfCodeTest.Day7Test do
  use ExUnit.Case

  describe "day 7" do
    test "part 1" do
      assert AdventOfCode.Day7.Part1.run("./input/day_07.txt", "shiny gold") == 257
    end

    test "part 2" do
      assert AdventOfCode.Day7.Part2.run("./input/day_07_test.txt", "shiny gold") == 126
      assert AdventOfCode.Day7.Part2.run("./input/day_07.txt", "shiny gold") == 1038
    end
  end
end
