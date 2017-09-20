require 'pry'

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    return "error" unless ALPHABET.include?(letter)
    width = 2 * ALPHABET.index(letter) + 1
    diamond_arr = ('A'..letter).to_a.map do |ltr|
      make_one_row(ltr, width)
    end
    (diamond_arr + diamond_arr[0..-2].reverse).join()
  end

  def self.make_one_row(letter, width)
    return "A".center(width).concat("\n") if letter == "A"
    num_spaces = 2 * ALPHABET.index(letter) - 1
    (letter + " " * num_spaces + letter).center(width) + "\n"
  end
end

puts Diamond.make_diamond('Z')
