def engage_rovers(input)
  instructions = input.chomp.split("\n")
  instructions.reject! { |el| el == "" }
  instructions.map! { |el| el.gsub(/\s+/, "") }

  # x_range = instructions[0]
  # rovers = []
  instructions
end

TEST_INPUT = <<~HEREDOC
  5 5

  1 2 N

  LMLMLMLMM

  3 3 E
HEREDOC

p engage_rovers(TEST_INPUT)
