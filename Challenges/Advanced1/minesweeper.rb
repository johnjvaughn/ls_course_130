class ValueError < StandardError; end

class Board
  MINE = '*'

  def self.transform(input)
    raise ValueError unless valid?(input)
    input.map.with_index do |row, y|
      row.chars.map.with_index do |char, x|
        if char == ' '
          count = count_mines(input, x, y)
          count > 0 ? count.to_s : char
        else
          char
        end
      end.join
    end
  end

  def self.valid?(input)
    input.map(&:size) == [input.first.size] * input.size &&
      input.first.match(/^\+\-+\+$/) &&
      input.first == input.last &&
      input[1..-2].all? { |row| row.match(/^\|[ \*]+\|$/) }
  end

  def self.count_mines(input, x, y)
    # count the number of mines surrounding the space at row x, col y
    ((y - 1)..(y + 1)).sum do |row|
      input[row][(x - 1)..(x + 1)].count(MINE)
    end
  end
end

inp = ['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
       '| *  * |', '|      |', '+------+']
puts inp
puts Board.transform(inp)
