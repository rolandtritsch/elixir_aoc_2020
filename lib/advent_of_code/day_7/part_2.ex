defmodule AdventOfCode.Day7.Part2 do
  # credit: https://github.com/anamba/adventofcode2020/blob/main/lib/day7/part2.ex

  def count_bags_that_contain_color(rules, target, multiplayer \\ 1) do
    case rules[target] do
      nil ->
        0

      [] ->
          multiplayer

      contents ->

        multiplayer +
          (Enum.map(contents, fn {color, quantity} ->
             multiplayer * count_bags_that_contain_color(rules, color, quantity)
           end)
           |> Enum.sum())
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
    count = file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&parse_rule/1)
    |> Enum.into(%{})
    |> count_bags_that_contain_color(bag_color)

    count - 1
  end
end
