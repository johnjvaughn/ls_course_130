class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError, 'Slice is longer than the series.' if length > @digits.size
    substrs(length)
  end

  private

  def substrs(length)
    collection = []
    while collection.size <= @digits.size - length
      collection << @digits.slice(collection.size, length)
    end
    collection
  end
end

ser = Series.new('12345')
# p ser.slices(0)
 p ser.slices(1)
 p ser.slices(2)
# p ser.slices(3)
# p ser.slices(4)
# p ser.slices(5)
# p ser.slices(6)