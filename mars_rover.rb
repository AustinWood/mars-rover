def engage_rovers(input)
  instructions = input.chomp.split("\n")
  instructions.reject! { |el| el == "" }
  instructions.map! { |el| el.gsub(/\s+/, "") }

  x_range = (0..instructions[0][0].to_i)
  y_range = (0..instructions[0][1].to_i)

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
