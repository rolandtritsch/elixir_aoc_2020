defmodule AdventOfCode.Day13.Part1 do
  def run(file_path) do
    file_path
    |> parse_input()
  end

  def parse_input(file_path) do
    [time_str, buses_str] =
      file_path
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Enum.into([])

    time = String.to_integer(time_str)

    {time, bus} =
      buses_str
      |> String.split(",")
      |> Enum.reject(&(&1 == "x"))
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&calc_depature(time, &1))
      |> Enum.sort()
      |> Enum.at(0)

    time * bus
  end

  @doc """
   remainder = rem (arrival time) (bus number)
   {wait_time, bus number} = (bus number) - remainder
   {wait_time, bus number} = find min {wait_time, _}
   wait_time * bus number
  """
  def calc_depature(time, bus) do
    {bus - rem(time, bus), bus}
  end
end
