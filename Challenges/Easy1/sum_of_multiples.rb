class SumOfMultiples
  DEFAULT_NUMS = [3, 5]

  def initialize(*numbers)
    @numbers = numbers.map(&:to_i).reject { |n| n == 0 }
    @numbers = DEFAULT_NUMS if @numbers.empty?
  end
  
  def to(max)
    (1...max).sum { |n| @numbers.any? { |num| n % num == 0 } ? n : 0 }
  end

  def self.to(max)
    self.new.to(max)
  end
end

p SumOfMultiples.new(2, 3).to(10)
p SumOfMultiples.new(1).to(20)
p SumOfMultiples.new(0, 0).to(20)

