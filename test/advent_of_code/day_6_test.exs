defmodule AdventOfCodeTest.Day6Test do
  use ExUnit.Case

  describe "day 6" do
    setup do
      {:ok, sample_groups: [["abc"], ["a", "b", "c"], ["ab", "ac"], ["a", "a", "a", "a"], ["b"]]}
    end

    test "part 1, sum yeses count by group", %{sample_groups: sample_groups} do
      assert AdventOfCode.Day6.Part1.parse_group(sample_groups) == 11
      assert AdventOfCode.Day6.Part1.parse_group([["jmqnkzlsfedaptx", "usjfkadqwmeyilph"]]) == 20
      assert AdventOfCode.Day6.Part1.run("./input/day_06.txt") == 6437
    end

    test "part 2", %{sample_groups: sample_groups} do
      assert AdventOfCode.Day6.Part2.parse_group(Enum.at(sample_groups, 0)) == 3
      assert AdventOfCode.Day6.Part2.parse_group(Enum.at(sample_groups, 1)) == 0
      assert AdventOfCode.Day6.Part2.parse_group(Enum.at(sample_groups, 2)) == 1
      assert AdventOfCode.Day6.Part2.parse_group(Enum.at(sample_groups, 3)) == 1
      assert AdventOfCode.Day6.Part2.parse_group(Enum.at(sample_groups, 4)) == 1
      assert AdventOfCode.Day6.Part2.run("./input/day_06.txt") == 3229
    end
  end
end
