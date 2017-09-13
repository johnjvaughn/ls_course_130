class Integer
  ROMAN = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C', 90 => 'XC',
              50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }
  def to_roman
    number = self
    roman_num = ''
    ROMAN.each do |arabic, roman|
      while number >= arabic
        roman_num << roman
        number -= arabic
      end
    end
    roman_num
  end
end

# p 305, 305.to_roman
# p 1447, 1447.to_roman
# p 4089, 4089.to_roman
# p 80, 80.to_roman