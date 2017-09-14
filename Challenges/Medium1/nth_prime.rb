class Prime
  def self.nth(number)
    raise ArgumentError if number.to_i != number || number < 1
    n = 2
    prime_list = []
    loop do
      if self.prime?(n, prime_list)
        prime_list << n
        return n if prime_list.size == number
      end
      n += 1
    end
  end

  def self.prime?(number, list_of_smaller_primes)
    limit = Math.sqrt(number)
    list_of_smaller_primes.each do |n|
      return false if number % n == 0
      break if n >= limit
    end
    true
  end
end

# (1..10).each do |pr|
#   p Prime.nth(pr)
# end
# p Prime.nth(10_000)