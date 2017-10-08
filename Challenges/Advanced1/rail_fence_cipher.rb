class RailFenceCipher
  def self.encode(plain_text, num_rows)
    return plain_text if num_rows == 1 || plain_text == ''
    mapping = do_mapping(plain_text.size, num_rows)
    mapping.map { |map_index| plain_text[map_index] }.join
  end

  def self.decode(coded_text, num_rows)
    return coded_text if num_rows == 1 || coded_text == ''
    plain_text = ' ' * coded_text.length
    mapping = do_mapping(coded_text.size, num_rows)
    mapping.each_with_index do |map_index, index|
      plain_text[map_index] = coded_text[index]
    end
    plain_text
  end

  def self.do_mapping(msg_length, num_rows)
    rail_num = -1
    increasing = true
    rails = Array.new(num_rows) { [] }
    (0...msg_length).each do |num|
      rail_num = increasing ? rail_num + 1 : rail_num - 1
      if rail_num == 0
        increasing = true
      elsif rail_num == num_rows - 1
        increasing = false
      end
      rails[rail_num] << num
    end
    rails.each_with_object([]) { |rail, all_rails| all_rails.concat(rail) }
  end
end

p RailFenceCipher.encode('WEAREDISCOVEREDFLEEATONCE', 3)
p RailFenceCipher.decode('XXXXXXXXXOOOOOOOOO', 2)
