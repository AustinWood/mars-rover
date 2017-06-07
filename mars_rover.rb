def engage_rovers(input)
  # Parse intstructions into array and remove all whitespace
  instructions = input.chomp.split("\n")
  instructions.reject! { |el| el == "" }
  instructions.map! { |el| el.gsub(/\s+/, "") }

  # Define a range for valid x and y coordinates
  x_range = (0..instructions[0][0].to_i)
  y_range = (0..instructions[0][1].to_i)

  rovers = []

  # Iterate over each instruction
  (1...instructions.length).each do |i|
    line = instructions[i]

    if i.odd?
      # If index is odd, then add new rover to array
      # with specified x, y coordinates and orientation
      rovers.push({
        x: line[0],
        y: line[1],
        orientation: line[2]
      })
    else
      # Otherwise iterate over each character and mutate
      # the current rover's position and orientation accordingly
      line.chars.each do |c|

      end
    end
  end

  rovers
end

########################################
########################################
########################################

TEST_INPUT = <<~HEREDOC
  5 5

  1 2 N

  LMLMLMLMM

  3 3 E

  MMRMMRMRRM
HEREDOC

p engage_rovers(TEST_INPUT)
