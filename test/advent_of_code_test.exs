defmodule AdventOfCodeTest do
  use ExUnit.Case
  alias AdventOfCode.Day1
  alias AdventOfCode.Day2

  test "day 1, part 1 & 2" do
    assert Day1.Part1.run() == 969_024
    assert Day1.Part2.run() == 230_057_040
    assert Day1.Part1.calc([1721, 979, 366, 299, 675, 1456]) == 514_579
    assert Day1.Part1.calc2([1721, 979, 366, 299, 675, 1456]) == 514_579
    assert Day1.Part2.calc2([1721, 979, 366, 299, 675, 1456]) == 241_861_950
  end

  test "day 2, part 1" do
    assert Day2.Part1.run() == 625
    assert Day2.Part2.run() == 391
  end

  test "day 3, part 1" do
    assert AdventOfCode.Day3.Part1.forest("..##.......\n.#") == [{0, 2}, {0, 3}, {1, 1}]
    assert AdventOfCode.Day3.Part1.forest(test_forest_input()) == test_tree_coordinates()
    #    AdventOfCode.Day3.Part1.run(test_forest_input(), {3, 1}) |> IO.inspect(label: ">>>")
    assert AdventOfCode.Day3.Part1.run(test_forest_input(), {3, 1}) == 7
  end

  defp test_forest_input do
    """
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    """
  end

  defp test_tree_coordinates do
    [
      {0, 2},
      {0, 3},
      {1, 0},
      {1, 4},
      {1, 8},
      {2, 1},
      {2, 6},
      {2, 9},
      {3, 2},
      {3, 4},
      {3, 8},
      {3, 10},
      {4, 1},
      {4, 5},
      {4, 6},
      {4, 9},
      {5, 2},
      {5, 4},
      {5, 5},
      {6, 1},
      {6, 3},
      {6, 5},
      {6, 10},
      {7, 1},
      {7, 10},
      {8, 0},
      {8, 2},
      {8, 3},
      {8, 7},
      {9, 0},
      {9, 4},
      {9, 5},
      {9, 10},
      {10, 1},
      {10, 4},
      {10, 8},
      {10, 10}
    ]
  end
end
