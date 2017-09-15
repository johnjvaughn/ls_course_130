class Palindromes
  attr_reader :palindromes

  def initialize(options)
    @max_factor = options[:max_factor]
    @min_factor = options[:min_factor] || 1
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    (@min_factor..@max_factor).to_a.repeated_combination(2) do |num1, num2|
      @palindromes[num1 * num2] << [num1, num2] if palindrome?(num1 * num2)
    end
  end

  def largest_product
    @palindromes.keys.max
  end

  def largest
    Struct.new(:value, :factors).new(largest_product, palindromes[largest_product])
  end

  def smallest_product
    @palindromes.keys.min
  end

  def smallest
    Struct.new(:value, :factors).new(smallest_product, palindromes[smallest_product])
  end

  private

  def palindrome?(num)
    num.to_s.reverse == num.to_s
  end
end

pal = Palindromes.new(max_factor: 99, min_factor: 10)
pal.generate
p pal.largest
p pal.largest.factors
