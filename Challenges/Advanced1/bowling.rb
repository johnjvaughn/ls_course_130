class Frame
  attr_reader :ball1, :ball2

  def initialize(ball1 = nil, ball2 = nil)
    @ball1 = ball1
    @ball2 = ball2
  end

  def roll(num)
    if ball1.nil?
      @ball1 = num
    elsif !complete?
      @ball2 = num
      raise RuntimeError if raw_score > 10
    else
      raise RuntimeError
    end
  end

  def raw_score
    ball1.to_i + ball2.to_i
  end

  def next_score(frame_next1)
    return nil if frame_next1.ball1.nil?
    frame_next1.ball1.to_i
  end

  def next_two_scores(frame_next1, frame_next2)
    if frame_next1.strike?
      return nil if frame_next2.ball1.nil?
      return frame_next1.raw_score + frame_next2.ball1
    end
    return nil unless frame_next1.complete?
    frame_next1.raw_score
  end

  def score(frame_next1, frame_next2)
    return nil unless complete?
    if strike?
      next_two = next_two_scores(frame_next1, frame_next2)
      return next_two.nil? ? nil : 10 + next_two
    elsif spare?
      next_one = next_score(frame_next1)
      return next_one.nil? ? nil : 10 + next_one
    end
    raw_score
  end

  def complete?
    strike? || (ball1 && ball2)
  end

  def strike?
    ball1 && ball1.to_i == 10
  end

  def spare?
    ball1 && (ball1.to_i < 10) && (raw_score == 10)
  end

  def to_s
    return '|  X  |' if strike?
    format("| %1s %1s |", ball1, spare? ? "/" : ball2)
  end

  def print_plain
    return "X" if strike?
    ball1.to_s + (spare? ? "/" : ball2.to_s)
  end

  def print_10th(frame11, frame12)
    return to_s unless strike? || spare?
    output = "|  " + print_plain
    if strike?
      output += frame11.print_plain
      output += frame12.print_plain[0] if frame11.strike?
    elsif spare?
      output += frame11.print_plain[0]
    end
    output + "|"
  end
end

class Game
  def initialize
    @frame = 0
    @game = (0..11).map { |_| Frame.new }
  end

  def roll(num)
    raise RuntimeError unless (0..10).cover?(num)
    raise RuntimeError if complete?
    @game[@frame].roll(num)
    @frame += 1 if @game[@frame].complete?
  end

  def fill_balls_thrown
    count = (@game[10].ball1 ? 1 : 0)
    count += (@game[10].ball2 ? 1 : 0)
    count + (@game[11].ball1 ? 1 : 0)
  end

  def complete?
    !((@frame < 10) ||
      (@game[9].strike? && fill_balls_thrown < 2) ||
      (@game[9].spare? && fill_balls_thrown < 1))
  end

  def intra_score(up_to_frame = 9)
    total = 0
    @game.each_with_index do |frame, index|
      break if index > up_to_frame
      frame_score = frame.score(@game[index + 1], @game[index + 2])
      return nil if frame_score.nil?
      total += frame_score
    end
    total
  end

  def score
    raise RuntimeError unless complete?
    intra_score
  end

  def to_s_frames
    @game[0..8].map(&:to_s).join +
      @game[9].print_10th(@game[10], @game[11])
  end

  def to_s_scores
    (0..9).map do |index|
      format("| %3s |", intra_score(index))
    end.join
  end

  def to_s
    indices = (1..10).map { |num| format("  %2s   ", num) }.join
    indices + "\n" + to_s_frames + "\n" + to_s_scores
  end
end

game = Game.new
game.roll(5)
game.roll(5)
game.roll(3)
game.roll(4)
game.roll(10)
game.roll(10)
game.roll(9)
game.roll(0)
puts game.to_s
