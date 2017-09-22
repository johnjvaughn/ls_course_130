class Triplet
  attr_reader :nums

  def initialize(*nums)
    unless nums.count == 3
      raise ArgumentError, 'Triplet.new requires 3 numbers'
    end
    @nums = nums.sort
  end

  def sum
    nums.sum
  end

  def product
    nums.inject(1, :*)
  end

  def pythagorean?
    nums[0]**2 + nums[1]**2 == nums[2]**2
  end

  def to_s
    nums.join('_')
  end

  def self.where(options)
    max = options[:max_factor] || 10
    min = options[:min_factor] || 3
    sum = options[:sum]
    pyth_trips = []

    (min..max).to_a.combination(3).each do |nums|
      a, b, c = nums
      next if !sum.nil? && a + b + c != sum
      triplet = new(a, b, c)
      pyth_trips << triplet if triplet.pythagorean?
    end
    pyth_trips
  end
end

triplet = Triplet.new(3, 4, 7)
p triplet.sum
p triplet.product
p triplet.pythagorean?

puts Triplet.where({})
