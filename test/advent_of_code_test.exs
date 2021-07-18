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

  test "day 3, part 1 & 2" do
    assert AdventOfCode.Day3.Part1.run("./input/day_03.txt", {3, 1}) == 153

    trees =
      for slope <- [{3, 1}, {1, 1}, {5, 1}, {7, 1}, {1, 2}],
          do: AdventOfCode.Day3.Part2.run("./input/day_03.txt", slope)

    assert Enum.reduce(trees, fn t, acc -> t * acc end) == 2_421_944_712
  end

  describe "day 4, part 1" do
    test "parse_line/1" do
      input_string =
        "eyr:2021 hgt:168cm hcl:#fffffd pid:180778832 byr:1923 ecl:amb iyr:2019 cid:241"

      expected = %{
        "byr" => "1923",
        "cid" => "241",
        "ecl" => "amb",
        "eyr" => "2021",
        "hcl" => "#fffffd",
        "hgt" => "168cm",
        "iyr" => "2019",
        "pid" => "180778832"
      }

      assert AdventOfCode.Day4.parse_line(input_string) == expected
    end

    test "valid_fields?/1" do
      record = %{
        "byr" => "1923",
        "cid" => "241",
        "ecl" => "amb",
        "eyr" => "2021",
        "hcl" => "#fffffd",
        "hgt" => "168cm",
        "iyr" => "2019",
        "pid" => "180778832"
      }

      assert AdventOfCode.Day4.Part1.valid_fields?(record) == true
    end

    test "# of valid records" do
      assert AdventOfCode.Day4.Part1.run("./input/day_04.txt") == 260
    end
  end

  describe "day 4, part 2" do
    test "valid_field?/2" do
      assert AdventOfCode.Day4.Part2.valid?("hgt", "160cm") == true
      assert AdventOfCode.Day4.Part2.valid?("hgt", "60in") == true
      assert AdventOfCode.Day4.Part2.valid?("hgt", "100in") == false, "value out of range"
      assert AdventOfCode.Day4.Part2.valid?("hgt", "160m") == false, "invalid unit"
      assert AdventOfCode.Day4.Part2.valid?("hgt", "160ft") == false, "invalid unit"

      assert AdventOfCode.Day4.Part2.valid?("ecl", "amb") == true
      assert AdventOfCode.Day4.Part2.valid?("ecl", "xyz") == false, "invalid eye-color"

      assert AdventOfCode.Day4.Part2.valid?("pid", "000000001") == true

      assert AdventOfCode.Day4.Part2.valid?("pid", "0123456789") == false,
             "passport too long"

      assert AdventOfCode.Day4.Part2.valid?("hcl", "#73382a") == true
      assert AdventOfCode.Day4.Part2.valid?("hcl", "73382a") == false, "missing # symbol"
    end

    test "# of valid records" do
      assert AdventOfCode.Day4.Part2.run("./input/day_04.txt") == 153
    end
  end

  describe "day 5" do
    test "part 1, calculate seat ID" do
      assert AdventOfCode.Day5.Part1.parse_boarding_pass("BFFFBBFRRR") == 567
      assert AdventOfCode.Day5.Part1.parse_boarding_pass("FFFBBBFRRR") == 119
      assert AdventOfCode.Day5.Part1.parse_boarding_pass("BBFFBBFRLL") == 820
#      AdventOfCode.Day5.Part1.run("./input/day_04.txt")
    end
  end
end
