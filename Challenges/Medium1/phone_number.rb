class PhoneNumber
  attr_reader :number
  INVALID_RETURN = '0000000000'

  def initialize(messy_num)
    @messy_num = messy_num
    @number = cleanup_num
  end

  def area_code
    number[0..2]
  end

  def to_s
    format "(%s) %s-%s", number[0..2], number[3..5], number[6..-1]
  end

  private

  def cleanup_num
    clean_num = @messy_num.gsub(/[ \.\-\(\)]/, '')
    return INVALID_RETURN if clean_num.match(/\D/)
    return clean_num[1..-1] if clean_num.size == 11 && clean_num[0] == '1'
    clean_num.size == 10 ? clean_num : INVALID_RETURN
  end
end

number = PhoneNumber.new('(123) 456-7890').number
puts number
puts PhoneNumber.new('3234839283')
puts PhoneNumber.new('32348392a3').number
