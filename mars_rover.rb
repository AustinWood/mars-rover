def engage_rovers(input)
  # Parse intstructions into array and remove all whitespace
  instructions = input.chomp.split("\n")
  instructions.reject! { |el| el == "" }
  instructions.map! { |el| el.gsub(/\s+/, "") }

  # Define a range for valid x and y coordinates
  x_range = (0..instructions[0][0].to_i)
  y_range = (0..instructions[0][1].to_i)

  rovers = []

  (1...instructions.length).each do |i|
    line = instructions[i]
    p line
  end

  rovers
end

TEST_INPUT = <<~HEREDOC
  5 5

  1 2 N

  LMLMLMLMM

  3 3 E

  MMRMMRMRRM
HEREDOC

p engage_rovers(TEST_INPUT)
