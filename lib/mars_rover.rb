class MarsRover
  def self.engage_rovers(input)
    @instructions = self.parse_input(input)

    # Define a range for valid x and y coordinates
    @x_range = (0..@instructions[0][0].to_i)
    @y_range = (0..@instructions[0][1].to_i)

    # Declare an empty array to hold a hash representing each rover
    @rovers = []

    self.execute_instructions
    self.format_output
  end

  # Parse input into array of instructions and remove all whitespace
  def self.parse_input(input)
    instructions = input.chomp.split("\n")
    instructions.reject! { |el| el == "" }
    instructions.map! { |el| el.gsub(/\s+/, "") }
  end

  def self.execute_instructions
    (1...@instructions.length).each do |i|
      self.define_new_rover(@instructions[i]) if i.odd?
      self.move_rover(@instructions[i]) if i.even?
    end
  end

  # Add new rover to array with specified x, y coordinates and orientation
  def self.define_new_rover(definition)
    @rovers.push({
      x: definition[0].to_i,
      y: definition[1].to_i,
      orientation: definition[2]
    })
  end

  def self.move_rover(instructions)
    rover = @rovers.last
    instructions.chars.each do |c|
      case c
      when "L"
        orientation_map = {"N" => "W", "W" => "S", "S" => "E", "E" => "N"}
        rover[:orientation] = orientation_map[rover[:orientation]]
      when "R"
        orientation_map = {"N" => "E", "E" => "S", "S" => "W", "W" => "N"}
        rover[:orientation] = orientation_map[rover[:orientation]]
      when "M"
        case rover[:orientation]
        when "N"
          rover[:y] += 1
        when "E"
          rover[:x] += 1
        when "S"
          rover[:y] -= 1
        when "W"
          rover[:x] -= 1
        end
        self.validate_position(rover)
      end
    end
    @rovers[@rovers.length - 1] = rover
  end

  # Verify that the rover has not fallen off the plateau
  def self.validate_position(rover)
    unless @x_range.include?(rover[:x]) && @y_range.include?(rover[:y])
      raise "The rover has fallen off the plateau!"
    end
  end

  # Create output string in expected format
  def self.format_output
    output = @rovers.map do |rover|
      "#{rover[:x]} #{rover[:y]} #{rover[:orientation]}"
    end
    output.join("\n\n")
  end
end
