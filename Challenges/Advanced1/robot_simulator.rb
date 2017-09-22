class Robot
  BEARINGS = [:north, :east, :south, :west]
  RIGHT_TURNS = { north: :east, east: :south, south: :west, west: :north }
  LEFT_TURNS = RIGHT_TURNS.invert
  ADVANCES = { north: [0, 1], east: [1, 0], south: [0, -1], west: [-1, 0] }
  attr_reader :bearing

  def orient(direction)
    raise ArgumentError unless BEARINGS.include?(direction)
    @bearing = direction
    self
  end

  def turn_right
    @bearing = RIGHT_TURNS[bearing]
    self
  end

  def turn_left
    @bearing = LEFT_TURNS[bearing]
    self
  end

  def at(x, y)
    @x = x
    @y = y
    self
  end

  def coordinates
    [@x, @y]
  end

  def advance
    @x += ADVANCES[bearing].first
    @y += ADVANCES[bearing].last
    self
  end
end

class Simulator
  INSTRUCTIONS = {
    'A' => :advance,
    'L' => :turn_left,
    'R' => :turn_right
  }

  def instructions(command_str)
    command_str.chars.map { |char| INSTRUCTIONS[char] }
  end

  def place(robot, opts)
    robot.at(opts[:x], opts[:y]).orient(opts[:direction])
  end

  def evaluate(robot, command_str)
    instructions(command_str).each { |cmd| robot.send(cmd) }
  end
end
