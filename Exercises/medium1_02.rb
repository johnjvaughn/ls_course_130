class TextAnalyzer
  def process
    File.open('medium1_02.txt', 'r') do |file|
      yield(file.read)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split.count} words" }
