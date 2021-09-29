defmodule AdventOfCodeTest.Da3Test do
  use ExUnit.Case

  describe "day 3" do
    test "part 1 & 2" do
      assert AdventOfCode.Day3.Part1.run("./input/day_03.txt", {3, 1}) == 153

      assert AdventOfCode.Day3.Part2.run(
               "./input/day_03.txt",
               [
                 {3, 1},
                 {1, 1},
                 {5, 1},
                 {7, 1},
                 {1, 2}
               ]
             ) == 2_421_944_712
    end
  end
end
