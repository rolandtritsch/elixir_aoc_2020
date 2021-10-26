defmodule AdventOfCode.Day7.Part1 do
  # inspired by https://github.com/anamba/adventofcode2020/blob/main/lib/day7/part1.ex

  def count_bags_that_contain_color(rules, target) do
    rules
    |> Map.keys()
    |> MapSet.new()
    |> Enum.count(fn bag -> contains?(bag, target, rules) end)
  end

  def contains?(bag, target, rules, acc \\ [])

  def contains?(bag, target, rules, acc) do
    cond do
      bag in acc ->
        false

      Enum.any?(rules[bag], fn {color, _quantity} -> color == target end) ->
        true

      true ->
        Enum.any?(rules[bag], fn {color, _quantity} ->
          contains?(color, target, rules, [bag | acc])
        end)
    end
  end

  def parse_rule(rule) do
    %{"color" => color, "contents" => contents_str} =
      Regex.named_captures(~r/^(?<color>\w+ \w+) bags contain (?<contents>.*+)$/, rule)

    contents =
      contents_str
      |> String.split(",")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&parse_quantity/1)
      |> Enum.filter(& &1)

    {color, contents}
  end

  def parse_quantity("no other bags."), do: nil

  def parse_quantity(contents) do
    %{"color" => color, "quantity" => quantity} =
      Regex.named_captures(~r/^(?<quantity>\d+) (?<color>\w+ \w+) bag(s?)(\.?)$/, contents)

    {color, String.to_integer(quantity)}
  end

  def run(file_path, bag_color) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&parse_rule/1)
    |> Enum.into(%{})
    |> count_bags_that_contain_color(bag_color)
  end
end
