require "mars_rover"

describe MarsRover do
  it "returns the expected output" do
    input = <<~HEREDOC
      5 5

      1 2 N

      LMLMLMLMM

      3 3 E

      MMRMMRMRRM
    HEREDOC

    output = <<~HEREDOC
      1 3 N

      5 1 E
    HEREDOC
    expect(MarsRover.engage_rovers(input)).to eq(output.chomp)
  end
end

# expected output
# raises error
