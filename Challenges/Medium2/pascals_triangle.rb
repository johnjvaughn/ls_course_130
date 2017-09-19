# non-recursive version

class Triangle
  def initialize(num_rows)
    # assume num_rows >= 1
    @num_rows = num_rows
    @triangle = [[1]]
    build_triangle
  end

  def rows
    @triangle
  end

  private

  def add_row_to_triangle
    last_row = @triangle[-1]
    new_row = [1]
    index = 0
    while index < last_row.size - 1
      new_row << (last_row[index] + last_row[index + 1])
      index += 1
    end
    new_row << 1
    @triangle << new_row
  end

  def build_triangle
    while @triangle.size < @num_rows
      add_row_to_triangle
    end
  end
end

tri = Triangle.new(4)
p tri.rows
