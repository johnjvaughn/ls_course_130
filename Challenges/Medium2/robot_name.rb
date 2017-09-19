class Robot
  attr_reader :name
  LETTERS = ('A'..'Z').to_a.freeze
  @@names_in_use = []

  def initialize
    @name = new_name
  end

  def reset
    @@names_in_use.delete(name)
    @name = new_name
  end

  private

  def new_name
    name = ''
    loop do
      name = LETTERS.sample(2).join + rand(1000).to_s.rjust(3, '0')
      break unless @@names_in_use.include?(name)
    end
    @@names_in_use << name
    name
  end
end

robot = Robot.new
p robot.name
robot2 = Robot.new
p robot2.name
robot.reset
p robot.name
