defmodule AdventOfCodeTest.Day5Test do
  use ExUnit.Case

  describe "day 5" do
    test "part 1, calculate seat ID" do
      assert AdventOfCode.Day5.Part1.parse_boarding_pass("BFFFBBFRRR") == 567
      assert AdventOfCode.Day5.Part1.parse_boarding_pass("FFFBBBFRRR") == 119
      assert AdventOfCode.Day5.Part1.parse_boarding_pass("BBFFBBFRLL") == 820
      assert AdventOfCode.Day5.Part1.run("./input/day_05.txt") == 953
    end

    test "part 2, finds seat" do
      assert AdventOfCode.Day5.Part2.run("./input/day_05.txt") == 615
    end
  end
end
