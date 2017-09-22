class Cipher
  ALPHABET = ('a'..'z').to_a
  attr_reader :key

  def initialize(key = nil)
    @key = key
    if key.nil?
      @key = Array.new(100) { ALPHABET.sample }.join
    else
      raise ArgumentError, 'invalid key' unless valid_key?
    end
  end

  def valid_key?
    !(key == '' || key.match(/[^a-z]/))
  end

  def encode(text)
    shift_text(text, :encode)
  end

  def decode(coded_text)
    shift_text(coded_text, :decode)
  end

  private

  def shift_text(text, which_way)
    cipher_nums = key.chars.map { |char| char.ord - ALPHABET.first.ord }
    factor = which_way == :encode ? 1 : -1
    text.chars.map.with_index do |char, index|
      new_ord = char.ord + factor * cipher_nums[index % cipher_nums.size]
      new_ord += ALPHABET.size if new_ord < ALPHABET.first.ord
      new_ord -= ALPHABET.size if new_ord > ALPHABET.last.ord
      new_ord.chr
    end.join
  end
end

Cipher.new
