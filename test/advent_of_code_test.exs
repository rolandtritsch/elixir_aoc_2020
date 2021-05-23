defmodule AdventOfCodeTest do
  use ExUnit.Case
  alias AdventOfCode.DayOne.{PartOne, PartTwo}

  test "day1, part 1" do
    assert PartOne.run() == 969024
    assert PartTwo.run() == 230057040
  end
end
