require_relative 'Directory'
require_relative 'SysFile'
require_relative 'Reader'
require_relative 'Repository'

repo = Repository.new
reader = Reader.new(repo)

terminal_output = reader.adjust_input('./lib/day07/input.csv')

reader.read(terminal_output)


# p reader.repo.sum_of_at_most_100000_dirs
# p reader.repo.find_dir_to_delete
