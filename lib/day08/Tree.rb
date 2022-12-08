class Tree
  attr_reader :height
  attr_accessor :visible

  def initialize(height)
    @height = height
    @visible = "????"
  end
end
