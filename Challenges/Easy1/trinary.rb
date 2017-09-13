class Trinary
  BASE = 3
  VALID_TRINARY = '^[0-2]+$'

  def initialize(octal_str)
    @octal_str = octal_str.match?(VALID_TRINARY) ? octal_str : '0'
  end

  def to_decimal
    digits = @octal_str.reverse.chars.map(&:to_i)
    index = -1
    digits.sum do |digit|
      index += 1
      digit * (BASE**index)
    end
  end
end

# puts Trinary.new('65').to_decimal
# puts Trinary.new('11').to_decimal
# puts Trinary.new('210021').to_decimal
