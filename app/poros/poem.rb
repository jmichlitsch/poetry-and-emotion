class Poem
  attr_reader :lines, :title, :author
  attr_accessor :tone
  def initialize(poem_data)
    @lines = poem_to_string(poem_data[:lines])
    @title = poem_data[:title]
    @author = poem_data[:author]
    @tone = nil
  end

  def poem_to_string(poem_lines)
    poem = ""
    poem_lines.each do |line|
      poem << "#{line} "
    end
    poem
  end
end
