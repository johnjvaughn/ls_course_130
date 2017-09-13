class PerfectNumber
  CLASSES = { def: 'deficient', per: 'perfect', abu: 'abundant' }

  def self.classify(number)
    raise RuntimeError, "Argument must be an integer greater than zero" \
      unless valid?(number)
    sum_of_factors = list_of_factors(number).sum
    if sum_of_factors < number
      CLASSES[:def]
    elsif sum_of_factors > number
      CLASSES[:abu]
    else
      CLASSES[:per]
    end
  end

  def self.valid?(number)
    number > 0 && number.to_i == number
  end

  def self.list_of_factors(number)
    (1..(number / 2)).select { |n| number % n == 0 }
  end
end

p PerfectNumber.classify(18.3)
