class School
  def initialize
    @students = {} # hash where each key is a grade number, each value is an array of students
                   # 2 => ["Jim", "Sally"], 3 => ["Debbie"], etc.           
  end

  def add(student, grade)
    unless @students.key?(grade)
      @students[grade] = []
      @students = @students.to_a.sort_by { |grade,_| grade }.to_h
    end
    unless @students[grade].include?(student)
      @students[grade].push(student).sort!
    end
  end

  def grade(grade)
    @students.fetch(grade, [])
  end

  def to_h
    @students
  end
end

school = School.new
school.add('Chelsea', 3)
school.add('Logan', 7)
school.add('Devon', 7)
p school.to_h
