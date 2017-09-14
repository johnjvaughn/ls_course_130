class SecretHandshake
  CODEX = { 1 => 'wink', 10 => 'double blink', 100 => 'close your eyes', 1000 => 'jump' }
  REVERSE = 10000

  def initialize(number)
    if number.is_a?(Integer)
      @binary_str = convert_to_binary_str(number)
    elsif number.is_a?(String)
      @binary_str = number.gsub(/[^01]/, '')
    else
      @binary_str = ''
    end
  end

  def commands
    #iterate thru @binary_str.chars, adding values to return array
    cmd_array = []
    key = 1
    @binary_str.chars.reverse.each do |bit|
      if key == REVERSE
        cmd_array.reverse! if bit == '1'
        break
      end
      cmd_array << CODEX[key] if bit == '1'
      key *= 10
    end
    cmd_array
  end

  private

  def convert_to_binary_str(number)
    number %= 2**5  # take off any binary digits beyond 5 places
    4.downto(0).map do |power|
      if number >= 2**power
        number -= 2**power
        "1"
      else
        "0"
      end
    end.join
  end

end

secret = SecretHandshake.new("10001")
p secret.commands
secret = SecretHandshake.new(1)
p secret.commands