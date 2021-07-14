defmodule AdventOfCode.Day4.Part2 do
  alias AdventOfCode.Day4
  alias AdventOfCode.Day4.Part1

  def run(path) do
    path
    |> Day4.parse_file()
    |> Enum.filter(&Part1.valid_fields?/1)
    |> Enum.filter(&valid_values?/1)
    |> Enum.count()
  end

  def valid_values?(records) do
    Enum.all?(records, fn {key, value} -> valid?(key, value) end)
  end

  def valid?(field, year) when field in ["byr", "eyr", "iyr"] and is_binary(year),
    do: valid?(field, String.to_integer(year))

  def valid?("byr", year) when year in 1920..2002, do: true

  def valid?("iyr", year) when year in 2010..2020, do: true

  def valid?("eyr", year) when year in 2020..2030, do: true

  def valid?("hgt", {cm, "cm"}) when cm in 150..193, do: true
  def valid?("hgt", {inch, "in"}) when inch in 59..76, do: true
  def valid?("hgt", height) when is_binary(height), do: valid?("hgt", Integer.parse(height))
  def valid?("hgt", {_, _}), do: false

  def valid?("ecl", eye_color)
      when eye_color in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"],
      do: true

  def valid?("ecl", _), do: false

  def valid?("hcl", "#" <> hair_color), do: Regex.match?(~r/^[a-z0-9]{6}$/, hair_color)
  def valid?("hcl", _), do: false

  def valid?("pid", pid), do: Regex.match?(~r/^[0-9]{9}$/, pid)

  def valid?("cid", _), do: true

  def valid?(_, _), do: false
end
