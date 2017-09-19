class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.downcase.gsub(/[^a-z0-9]/, '')
  end

  def size
    (normalize_plaintext.size**0.5).ceil
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def ciphertext
    build_ciphertext
  end

  def normalize_ciphertext
    build_ciphertext(' ')
  end

  private

  def build_ciphertext(delim = '')
    cipher = ''
    (0...size).each do |index|
      plaintext_segments.map do |str|
        cipher += str[index] if index < str.size
      end
      cipher << delim if delim
    end
    cipher.strip
  end
end

crypto = Crypto.new('Time is an illusion. Lunchtime doubly so.')
p crypto.normalize_plaintext
p crypto.size
p crypto.plaintext_segments
p crypto.ciphertext
p crypto.normalize_ciphertext
