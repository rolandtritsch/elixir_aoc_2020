defmodule AdventOfCodeTest.Day7Test do
  use ExUnit.Case

  describe "day 7" do
    test "part 1" do
      assert AdventOfCode.Day7.Part1.run("./input/day_07test.txt", "shiny gold") === 4
      assert AdventOfCode.Day7.Part1.run("./input/day_07.txt", "shiny gold") === 278
    end

    test "part 2" do
      assert AdventOfCode.Day7.Part2.run("./input/day_07test.txt", "dark olive") === 7
      assert AdventOfCode.Day7.Part2.run("./input/day_07test.txt", "shiny gold") === 32
      assert AdventOfCode.Day7.Part2.run("./input/day_07test2.txt", "shiny gold") === 126
      assert AdventOfCode.Day7.Part2.run("./input/day_07.txt", "shiny gold") === 45157
    end
  end
end
