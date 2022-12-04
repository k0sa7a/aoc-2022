require 'csv'

def calculate(file_path)
  result = 0
  adjust_input(file_path).each do |elves_pair|
    first_elf = elves_pair[0]
    second_elf = elves_pair[1]
    if first_elf.all? { |n| second_elf.include? n } || second_elf.all? { |n| first_elf.include? n }
      result += 1
    end
  end
  result
end

def calculate_any_overlap(file_path)
  result = 0
  adjust_input(file_path).each do |elves_pair|
    first_elf = elves_pair[0]
    second_elf = elves_pair[1]
    if first_elf.any? { |n| second_elf.include? n } || second_elf.all? { |n| first_elf.include? n }
      result += 1
    end
  end
  result
end

def adjust_input(file_path)
  arr = []
  CSV.foreach(file_path, 'r', headers:false) do |row|
    array_two_values0 = row[0].split('-')
    array_two_values1 = row[1].split('-')
    row[0] = (array_two_values0[0].to_i..array_two_values0[1].to_i).to_a
    row[1] = (array_two_values1[0].to_i..array_two_values1[1].to_i).to_a
    arr << row
  end
  arr
end

# p calculate('./lib/day04/input.csv')
# p calculate_any_overlap('./lib/day04/input.csv')
