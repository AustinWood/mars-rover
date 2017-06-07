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

  it "raises an error if the rover goes out of range" do
    input = <<~HEREDOC
      5 5

      3 3 E

      MMRMMRMRRMM
    HEREDOC

    expect do
      MarsRover.engage_rovers(input)
    end.to raise_error("The rover has fallen off the plateau!")
  end
end
