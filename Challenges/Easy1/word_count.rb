#edge cases: punctuation?   case sensitivity?  hyphenated words?

class Phrase
  def initialize(str)
    self.str = str
  end

  def word_count
    words = @str.split
    word_hash = {}
    words.uniq.each do |word|
      word_hash[word] = words.count(word)
    end
    word_hash
  end

  private

  def str=(str)
    @str = normalize(str)
  end

  def normalize(str)
    # remove all punctuation except single quote marks and replace with spaces
    str.downcase
       .gsub(/[^\w\']/, " ")
       .gsub(/\'(\s|$)|(\s|^)\'/, " ")
  end
end

phr = Phrase.new("word")
p phr.word_count