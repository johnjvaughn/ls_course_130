class Luhn
  def initialize(number)
    @number = number.to_i
  end

  def addends
    @number.to_s.chars.reverse.map.with_index do |digit, index|
      digit = digit.to_i
      if index.odd?
        digit = digit > 4 ? 2 * digit - 9 : 2 * digit
      end
      digit
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    shifted_num = 10 * number
    digit_needed = new(shifted_num).checksum % 10
    digit_needed = (10 - digit_needed) unless digit_needed.zero?
    shifted_num + digit_needed
  end

end

luhn = Luhn.new(12_181)
p luhn.addends
p luhn.checksum
p luhn.valid?
p Luhn.create(873_956)