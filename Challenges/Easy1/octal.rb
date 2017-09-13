class Octal
  BASE = 8
  VALID_OCTAL = '^[0-7]+$'

  def initialize(octal_str)
    @octal_str = octal_str.match?(VALID_OCTAL) ? octal_str : '0'
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

#puts Octal.new('65').to_decimal
