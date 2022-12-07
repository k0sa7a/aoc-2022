class Repository
  attr_reader :directories

  def initialize
    @directories = []
    @total_space = 70_000_000
    @free_space_needed = 30_000_000
  end

  def sum_of_at_most_100000_dirs
    sum = 0
    @directories.each do |dir|
      if dir.size <= 100_000
        sum += dir.size
      end
    end
    sum
  end

  def find_dir_to_delete
    used_space = @directories.select {|dir| dir.name == "/"}[0].size
    not_used_space = @total_space - used_space

    still_required_space = @free_space_needed - not_used_space

    options = []
    @directories.each do |dir|
      if dir.size >= still_required_space
        options << dir.size
      end
    end
    options.min
  end
end
