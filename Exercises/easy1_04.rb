def divisors(num)
  return [1] if num == 1
  divs = [1] + (2..(num / 2)).select { |n| num % n == 0 } + [num]
end

def divisors2(num)
  divs = []
  (1..Math.sqrt(num)).each { |n| divs += [n, num / n] if num % n == 0 }
  divs.uniq.sort
end

p divisors(1) == [1]
p divisors(2) == [1, 2]
p divisors(7) == [1, 7]
p divisors(9) == [1, 3, 9]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
#p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
puts

p divisors2(1) == [1]
p divisors2(2) == [1, 2]
p divisors2(7) == [1, 7]
p divisors2(9) == [1, 3, 9]
p divisors2(12) == [1, 2, 3, 4, 6, 12]
p divisors2(98) == [1, 2, 7, 14, 49, 98]
p divisors2(99400891) == [1, 9967, 9973, 99400891] # may take a minute
