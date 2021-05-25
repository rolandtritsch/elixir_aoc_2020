defmodule AdventOfCodeTest do
  use ExUnit.Case
  alias AdventOfCode.DayOne
  alias AdventOfCode.DayTwo

  test "day 1, part 1 & 2" do
    assert DayOne.PartOne.run() == 969_024
    assert DayOne.PartTwo.run() == 230_057_040
  end

  test "day 2, part 1" do
    assert DayTwo.PartOne.run() == 625
    assert DayTwo.PartTwo.run() == 391
  end
end
