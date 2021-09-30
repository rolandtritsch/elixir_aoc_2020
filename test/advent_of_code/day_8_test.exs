defmodule AdventOfCodeTest.Day8Test do
  use ExUnit.Case

  describe "day 8" do
    test "part 1" do
      assert AdventOfCode.Day8.Part1.parse("nop +0") == {"nop", "+", 0}
      assert AdventOfCode.Day8.Part1.parse("jmp -3") == {"jmp", "-", 3}
      assert AdventOfCode.Day8.Part1.run("./input/day_08_test.txt") == 5
      assert AdventOfCode.Day8.Part1.run("./input/day_08.txt") == 1521
    end

    test "part 2" do
    end
  end
end
