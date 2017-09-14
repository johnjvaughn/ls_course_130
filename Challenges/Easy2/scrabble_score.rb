class Scrabble
  POINTS = {
    1 => "AEIOULNRST",
    2 => "DG",
    3 => "BCMP",
    4 => "FHVWY",
    5 => "K",
    8 => "JX",
    10 => "QZ"
  }.freeze

  def initialize(word)
    @word = word
  end

  def score
    self.class.score(@word)
  end

  def self.score(word)
    word = word.class == String ? word.upcase.gsub(/[^A-Z]/, '') : ''
    POINTS.sum { |scr, letters| word.count(letters) * scr }
  end
end

p Scrabble.new('WORD').score
