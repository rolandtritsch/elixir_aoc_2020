defmodule AdventOfCodeTest.Day14Test do
  use ExUnit.Case

  alias AdventOfCode.Day14.Part1

  setup_all do
    file_path = "./input/day_14_test.txt"
    input = file_path |> Part1.parse_input()

    {:ok, input: input}
  end

  describe "day 14" do
    test "parse_input", state do
      expected = [
        %Part1.Instruction.Mask{
          mask: [
            "X", "0", "X", "X", "X", "X", "1", "X", "X", "X", "X",
            "X", "X", "X", "X", "X", "X", "X", "X", "X", "X", "X",
            "X", "X", "X", "X", "X", "X", "X", "X", "X", "X", "X",
            "X", "X", "X"
          ]
        },
        %Part1.Instruction.Mem{addr: 8, value: 11},
        %Part1.Instruction.Mem{addr: 7, value: 101},
        %Part1.Instruction.Mem{addr: 8, value: 0}
      ]

      assert state[:input] == expected
    end

    test "apply_mask", state do
      mask_instr = state[:input] |> Enum.at(0)
      mem_instr = state[:input] |> Enum.at(1)
      
      assert Part1.apply_mask(mask_instr.mask, mem_instr.value) == 73
    end

    test "evaluate - mask", state do
      mask_instr = state[:input] |> Enum.at(0)
      
      expected = %Part1.Memory{mask: mask_instr.mask}

      assert Part1.evaluate(mask_instr, %Part1.Memory{}) == expected
    end

    test "evaluate - mem", state do
      mask_instr = state[:input] |> Enum.at(0)
      mem_instr = state[:input] |> Enum.at(1)

      expected = %Part1.Memory{mask: mask_instr.mask, memory: %{8 => 73}}

      memory = Part1.evaluate(mask_instr, %Part1.Memory{})
      assert Part1.evaluate(mem_instr, memory) == expected
    end
    
    test "part 1" do
      assert Part1.run("./input/day_14_test.txt") == 165
      assert Part1.run("./input/day_14.txt") == 4886706177792
      assert Part1.run("./input/day_14b.txt") == 7440382076205
    end

    test "part 2" do
    end
  end
end
