require 'csv'
require_relative 'Directory'
require_relative 'SysFile'

class Reader
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def adjust_input(file_path)
    arr = []
    CSV.foreach(file_path, row_sep: "\n") do |row|
      arr << row[0]
    end
    arr
  end

  def read(terminal_output)
    current_dir = create_dir("/")
    terminal_output.each do |command|
      if command == "$ cd .."
        current_dir = current_dir.parent
      elsif command == "$ ls"
      elsif command =~ /dir (.+)/
        name = command.scan(/dir (.+)/)[0][0]
        created_dir = create_dir(name)
        created_dir.parent = current_dir
        created_dir.parent.contents << created_dir
      elsif command =~ /\$ cd [^\/]/
        name = command.scan(/\$ cd (.+)/)[0][0]
        new_dir = current_dir.contents.select {|element| element.is_a?(Directory) && element.name == name}[0]
        new_dir.parent = current_dir
        current_dir = new_dir
      elsif command =~ /[0-9] .+/
        file_name = command.scan(/[0-9] (.+)/)[0][0]
        file_size = command.scan(/([0-9]+) .+/)[0][0]
        file = SysFile.new(file_name, file_size)
        current_dir.contents << file
      end
    end
    root = @repo.directories.select {|element| element.name == "/"}[0]
    root.calculate_size
  end

  def create_dir(name)
    dir = Directory.new(name)
    repo.directories << dir
    dir
  end

end
