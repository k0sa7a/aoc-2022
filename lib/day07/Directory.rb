class Directory
  attr_accessor :size, :parent, :name
  attr_reader :contents, :size

  def initialize(name)
    @name = name
    @size = 0
    @contents = []
    @parent = nil
  end

  def calculate_size
    if self.contents.all?{|item| item.is_a?(SysFile)}
      @contents.each {|item| @size += item.size.to_i}
    elsif
      @contents.each do |item|
        if item.is_a?(SysFile)
          @size += item.size.to_i
        else
          @size += item.calculate_size
        end
      end
    end
    @size
  end

end
