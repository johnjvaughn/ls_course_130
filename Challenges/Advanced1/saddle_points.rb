class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_str)
    @rows = matrix_str.split("\n").map { |line| line.split.map(&:to_i) }
    @columns = rows.transpose
  end

  def saddle_points
    (0...rows.count).each_with_object([]) do |row, saddle_pts|
      (0...columns.count).each do |col|
        saddle_pts << [row, col] if saddle_point?(row, col)
      end
    end
  end

  def saddle_point?(row, col)
    rows[row][col] == rows[row].max &&
      columns[col][row] == columns[col].min
  end
end

matrix = Matrix.new("1 2\n10 20")
p matrix.rows
p matrix.columns
p matrix.saddle_points
