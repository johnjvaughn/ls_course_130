class InputError < StandardError; end

class OCR
  OCR_DIGITS = Array.new(10)
  OCR_DIGITS[0] = <<-NUMBER.chomp
 _
| |
|_|
    NUMBER
  OCR_DIGITS[1] = <<-NUMBER.chomp

  |
  |
    NUMBER
  OCR_DIGITS[2] = <<-NUMBER.chomp
 _
 _|
|_
    NUMBER
  OCR_DIGITS[3] = <<-NUMBER.chomp
 _
 _|
 _|
    NUMBER
  OCR_DIGITS[4] = <<-NUMBER.chomp

|_|
  |
    NUMBER
  OCR_DIGITS[5] = <<-NUMBER.chomp
 _
|_
 _|
    NUMBER
  OCR_DIGITS[6] = <<-NUMBER.chomp
 _
|_
|_|
    NUMBER
  OCR_DIGITS[7] = <<-NUMBER.chomp
 _
  |
  |
    NUMBER
  OCR_DIGITS[8] = <<-NUMBER.chomp
 _
|_|
|_|
    NUMBER
  OCR_DIGITS[9] = <<-NUMBER.chomp
 _
|_|
 _|
    NUMBER
  LINE_COUNT = 4
  DIGIT_WIDTH = 3

  def initialize(text)
    @text = text
    # next line insures we have a top line even if no ocr's use it
    @text.prepend(' ') if @text.start_with?("\n")
    lines = @text.split("\n")
    @text_arrs = []
    index = 0
    while index < lines.count
      @text_arrs += [lines[index, (LINE_COUNT - 1)].map do |line|
                       line.scan(/.{1,3}/)
                     end]
      index += LINE_COUNT
    end
    @text_arrs.map! do |text_arr|
      text_arr.transpose.map { |ocr| ocr.map(&:rstrip).join("\n") }
    end
  end

  def convert
    raise InputError unless correct_size?
    @text_arrs.map do |text_arr|
      text_arr.map do |ocr|
        OCR_DIGITS.include?(ocr) ? OCR_DIGITS.index(ocr).to_s : '?'
      end.join
    end.join(',')
  end

  def correct_size?
    (@text.split("\n").count + 1) % LINE_COUNT == 0
  end
end

# text1 = <<-NUMBER.chomp
#        _     _        _  _
#   |  || |  || |  |  || || |
#   |  ||_|  ||_|  |  ||_||_|

#     NUMBER
text2 = <<-NUMBER.chomp
    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|

NUMBER
ocr = OCR.new(text2)
p ocr.convert
