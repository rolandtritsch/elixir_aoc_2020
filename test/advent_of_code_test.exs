defmodule AdventOfCodeTest do
  use ExUnit.Case

  test "day 1, part 1 & 2" do
    assert AdventOfCode.Day1.Part1.run("./input/day_01.txt") == 969_024
    assert AdventOfCode.Day1.Part2.run("./input/day_01.txt") == 230_057_040
    assert AdventOfCode.Day1.Part1.calc([1721, 979, 366, 299, 675, 1456]) == 514_579
    assert AdventOfCode.Day1.Part1.calc2([1721, 979, 366, 299, 675, 1456]) == 514_579
    assert AdventOfCode.Day1.Part2.calc2([1721, 979, 366, 299, 675, 1456]) == 241_861_950
  end

  test "day 2, part 1" do
    assert AdventOfCode.Day2.Part1.run("./input/day_02.txt") == 625
    assert AdventOfCode.Day2.Part2.run("./input/day_02.txt") == 391
  end

  test "day 3, part 1 & 2" do
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
      assert AdventOfCode.Day5.Part1.run("./input/day_05.txt") == 953
    end

    test "part 2, finds seat" do
      assert AdventOfCode.Day5.Part2.run("./input/day_05.txt") == 615
    end
  end

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

  describe "day 7" do
    test "part 1" do
      assert AdventOfCode.Day7.Part1.run("./input/day_07.txt", "shiny gold") == 257
    end

    test "part 2" do
      assert AdventOfCode.Day7.Part2.run("./input/day_07_test.txt", "shiny gold") == 126
      assert AdventOfCode.Day7.Part2.run("./input/day_07.txt", "shiny gold") == 1038
    end
  end

  describe "day 8" do
    test "part 1" do
      assert AdventOfCode.Day8.Part1.parse("nop +0") == {"nop", "+", 0}
      assert AdventOfCode.Day8.Part1.parse("jmp -3") == {"jmp", "-", 3}
      assert AdventOfCode.Day8.Part1.run("./input/day_08_test.txt") == 5
      assert AdventOfCode.Day8.Part1.run("./input/day_08.txt") == 1521
    end

    test "part 2" do
      # assert AdventOfCode.Day8.Part2.run("./input/day_08_test.txt") == 8
      # assert AdventOfCode.Day8.Part2.run("./input/day_08.txt") == 8
    end
  end

  describe "day 9" do
    test "part 1" do
      assert AdventOfCode.Day9.Part1.run("./input/day_09_test.txt", 5) == 127
#      assert AdventOfCode.Day9.Part1.run("./input/day_09.txt", 25) == 127
    end

    test "part 2" do
    end
  end
end
