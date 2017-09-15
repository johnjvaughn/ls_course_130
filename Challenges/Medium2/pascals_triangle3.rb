# mathematical, binomial method
class Integer
  def fact
    (2..self).inject(1) { |f, n| f * n }
  end
end

class Triangle
  def initialize(num_rows)
    # assume num_rows >= 1
    @triangle = build_triangle(num_rows)
  end

  def rows
    @triangle
  end

  private

  def build_triangle(num_rows)
    (0...num_rows).map do |row|
      (0..row).map do |col|
        row.fact / (col.fact * (row - col).fact) # binomial coefficients a(k) = n!/(k!(n-k)!)
      end
    end
  end
end

tri = Triangle.new(6)
p tri.rows