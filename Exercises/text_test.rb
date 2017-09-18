require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample.txt', 'r')
    @text = @file.read
    @text_obj = Text.new(@text)
  end

  def test_swap
    swapped_text = @text_obj.swap('a', 'e')
    #expected_text = @text.chars.map { |char| char == 'a' ? 'e' : char }.join
    expected_text = <<~TEXT
      Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
      Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
      quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
      nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
      dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
      et verius meuris, et pheretre mi.
      TEXT
    assert_equal(expected_text, swapped_text)
  end

  def test_word_count
    assert_equal(72, @text_obj.word_count)
  end

  def teardown
    @file.close
  end
end
