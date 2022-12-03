require_relative 'Storage'

def calculate(input)
  adjusted_input = adjust_input(input)
  result = 0
  adjusted_input.each do |backpack|
    result += Storage.values[check_one_backpack(backpack)]
  end
  result
end

def adjust_input(input)
  arr_of_backpacks = input.split("\n")
  arr_of_backpacks.map { |backpack| backpack.strip! }
  arr_of_backpacks.map! { |backpack| backpack.split('') }
  arr_of_backpacks.map! do |backpack|
    backpack.each_slice((backpack.size / 2.0).round).to_a
  end
  arr_of_backpacks
end

def check_one_backpack(backpack)
  result = nil
  backpack[0].each do |item|
    result = item if backpack[1].include?(item)
  end
  result
end

# p calculate(Storage.input)
