class ArgumentError < StandardError; end

class Queens
  BOARD_DIMENSION = 8
  WHITE_TOKEN = 'W'
  BLACK_TOKEN = 'B'
  EMPTY_TOKEN = '_'
  attr_reader :white, :black

  def initialize(positions = { white: [0, 3], black: [7, 3]} )
    @white = positions[:white]
    @black = positions[:black]
    validate
  end
  
  def validate
    if (white + black).any? { |coord| coord < 0 || coord >= BOARD_DIMENSION }
      raise ArgumentError, "Piece coordinates must be in range 0 to #{BOARD_DIMENSION - 1}"
    end
    raise ArgumentError, "2 pieces cannot occupy one space." if white == black
  end

  def attack?
    white.first == black.first || white.last == black.last ||
      (white.first - black.first).abs == (white.last - black.last).abs
  end

  def to_s
    (0...BOARD_DIMENSION).map do |rank|
      (0...BOARD_DIMENSION).map do |file|
        if (@white == [rank, file])
          WHITE_TOKEN
        elsif (@black == [rank, file])
          BLACK_TOKEN
        else
          EMPTY_TOKEN
        end
      end.join(" ")
    end.join("\n")
  end
end
