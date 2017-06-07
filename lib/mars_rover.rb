class MarsRover
  def self.engage_rovers(input)
    # Parse intstructions into array and remove all whitespace
    instructions = input.chomp.split("\n")
    instructions.reject! { |el| el == "" }
    instructions.map! { |el| el.gsub(/\s+/, "") }

    # Define a range for valid x and y coordinates
    x_range = (0..instructions[0][0].to_i)
    y_range = (0..instructions[0][1].to_i)

    # Declare an empty array to hold a hash representing each rover
    rovers = []

    # Iterate over each instruction
    (1...instructions.length).each do |i|
      line = instructions[i]

      if i.odd?
        # If index is odd, then add new rover to array
        # with specified x, y coordinates and orientation
        rovers.push({
          x: line[0].to_i,
          y: line[1].to_i,
          orientation: line[2]
        })
      else
        # Otherwise iterate over each character and mutate
        # the current rover's position and orientation accordingly
        rover = rovers.last
        line.chars.each do |c|
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

            unless x_range.include?(rover[:x]) && y_range.include?(rover[:y])
              raise "The rover has fallen off the plateau!"
            end
          end
        end
        rovers[rovers.length - 1] = rover
      end
    end

    # Create output string in expected format
    rovers_output = rovers.map do |rover|
      "#{rover[:x]} #{rover[:y]} #{rover[:orientation]}"
    end
    rovers_output.join("\n\n")
  end
end
