# recursive method

class Triangle
  def initialize(num_rows)
    # assume num_rows >= 1
    @num_rows = num_rows
    @triangle = build_triangle(num_rows)
  end

  def rows
    @triangle
  end

  private

  def add_row_to_triangle!(tri)
    last_row = tri[-1]
    new_row = [1]
    index = 0
    while index < last_row.size - 1
      new_row << (last_row[index] + last_row[index + 1])
      index += 1
    end
    tri << (new_row << 1)
  end

  def build_triangle(n)
    return [[1]] if n <= 1
    tri = build_triangle(n - 1)
    add_row_to_triangle!(tri)
  end
end

tri = Triangle.new(6)
p tri.rows
