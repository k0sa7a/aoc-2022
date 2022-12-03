require_relative 'Storage'

def calculate(input)
  adjusted_input = adjust_input(input)
  result = 0
  adjusted_input.each do |group|
    result += Storage.values[check_one_group(group)]
  end
  result
end

def adjust_input(input)
  arr_of_backpacks = input.split("\n")
  arr_of_backpacks.map { |backpack| backpack.strip! }
  arr_of_backpacks.map! { |backpack| backpack.split('') }
  arr_of_backpacks.each_slice(3).to_a
end

def check_one_group(group)
  result = nil
  group[0].each { |item| result = item if group[1].include?(item) && group[2].include?(item) }
  result
end

# p calculate(Storage.input)
