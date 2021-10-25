defmodule AdventOfCode.Day14.Part1 do
  @moduledoc """
  Solving Part 1 of Day 14.

  Reading the input file into a list of instructions.
  Then I am evaluating every instruction one-by-one.
  Every instruction will update the current mask or will
  update a memory address (while applying the mask).
  When we are done with all instructions, we just
  sum up all values that are in memory.
  """

  # data structures

  defmodule Instruction.Mask do
    @typedoc """
    And instruction of type mask.
    """
    defstruct mask: nil

    @type t(mask) :: %Instruction.Mask{mask: mask}
    @type t :: %Instruction.Mask{mask: list(String.t())}        
  end

  defmodule Instruction.Mem do
    @typedoc """
    And instruction of type mem.
    """
    defstruct addr: nil, value: nil 

    @type t(addr, value) :: %Instruction.Mem{addr: addr, value: value}
    @type t :: %Instruction.Mem{addr: integer, value: integer}        
  end
                             
  defmodule Memory do
    @typedoc """
    A block of memory. And the current mask.
    """
    defstruct memory: %{}, mask: []

    @type t(memory, mask) :: %Memory{memory: memory, mask: mask}
    @type t :: %Memory{memory: %{integer => integer}, mask: list(String.t())}
  end

  # public functions

  @doc """
  Takes a file_path and solves the problem. Returns the solution.
  """
  @spec run(String.t()) :: integer
  def run(file_path)
  
  def run(file_path) do
    instructions = file_path |> parse_input()
    final_memory = instructions |> Enum.reduce(%Memory{}, &evaluate/2)
    final_memory.memory |> Map.values() |> Enum.sum()
  end

  # private functions

  @doc """
  Takes a file_path. Returns the instructions to process.
  """
  @spec parse_input(String.t()) :: list(Instruction.Mask.t() | Instruction.Mem.t())
  def parse_input(file_path)
  
  def parse_input(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.map(&parse_line/1)
  end

  @doc """
  Parse a line. Return an instruction.
  """
  @spec parse_line(String.t()) :: Instruction.Mask.t() | Instruction.Mem.t()
  def parse_line(line)
  
  def parse_line("mask = " <> mask_str) do
    mask =
      mask_str
      |> String.graphemes()
      |> Enum.reverse()

    %Instruction.Mask{mask: mask}
  end

  def parse_line("mem[" <> memory_str) do
    {addr, rest} = Integer.parse(memory_str)
    "] = " <> value_str = rest

    %Instruction.Mem{addr: addr, value: String.to_integer(value_str)}
  end

  @doc """
  Evaluate an instruction. Return the updated memory. 
  """
  @spec evaluate(Instruction.Mask.t() | Instruction.Mem.t(), Memory.t()) :: Memory.t() 
  def evaluate(instruction, memory)
  
  def evaluate(
    %Instruction.Mask{} = mask,
    %Memory{} = memory
  ) do
    %{memory | mask: mask.mask}
  end

  def evaluate(
    %Instruction.Mem{} = instr_mem,
    %Memory{} = memory
  ) do
    new_value = memory.mask |> apply_mask(instr_mem.value)
    %{memory | memory: Map.put(memory.memory, instr_mem.addr, new_value)}
  end

  @doc """
  Apply the given mask to the given value. Return the resulting value.
  """
  @spec apply_mask(String.t(), integer) :: integer
  def apply_mask(mask, value)
  
  def apply_mask(mask, value) do
    binary = Integer.digits(value, 2) |> Enum.reverse()

    for {binary_mask, i} <- Enum.with_index(mask) do
      case binary_mask do
        "1" -> 1
        "0" -> 0
        "X" -> Enum.at(binary, i) || 0
      end
    end
    |> Enum.reverse()
    |> Integer.undigits(2)
  end
end
