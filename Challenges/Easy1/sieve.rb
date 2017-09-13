class Sieve
  def initialize(upper_limit)
    @upper_limit = upper_limit
  end

  def primes
    sieve_array = (2..@upper_limit).to_a
    primes_list = []
    upper_limit_sqrt = Math.sqrt(@upper_limit)
    loop do
      next_prime = sieve_array.shift
      primes_list << next_prime
      (next_prime..@upper_limit).step(next_prime) { |n| sieve_array.delete(n) }
      if next_prime >= upper_limit_sqrt  # we can stop crossing out multiples once we reach
        primes_list += sieve_array       # the square root of @upper_limit
        break
      end
    end
    primes_list
  end
end

# sieve = Sieve.new(10)
# p sieve.primes
# sieve2 = Sieve.new(100)
# p sieve2.primes
