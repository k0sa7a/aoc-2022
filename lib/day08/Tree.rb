class Tree
  attr_reader :height
  attr_accessor :visible, :score

  def initialize(height)
    @height = height
    @visible = "????"
    @score = "?"
  end
end
