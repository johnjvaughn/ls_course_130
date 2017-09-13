class Anagram
  def initialize(word)
    @word = word.downcase
    @letters_sorted = @word.chars.sort
  end

  def match(candidates)
    candidates.select { |cand| anagram?(cand) }
  end

  private

  def anagram?(candidate)
    candidate.downcase.chars.sort == @letters_sorted && 
    candidate.downcase != @word
  end

end

# detector = Anagram.new('Orchestra')
# p detector.match %w(cashregister Carthorse radishes)