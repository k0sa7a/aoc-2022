require 'csv'

def calculate(input, use_file = false)
  if use_file == true
    input_to_use = adjust_input(input)
  else
    input_to_use = input
  end
  arr = input_to_use.split('')
  result = nil
  for i in 0..arr.length
    test_arr = arr[i..(i + 3)]
    if test_arr == test_arr.uniq
      result = i + 4
      break
    end
  end
  result
end

def calculate_02(input, use_file = false)
  if use_file == true
    input_to_use = adjust_input(input)
  else
    input_to_use = input
  end
  arr = input_to_use.split('')
  result = nil
  for i in 0..arr.length
    test_arr = arr[i..(i + 13)]
    if test_arr == test_arr.uniq
      result = i + 14
      break
    end
  end
  result
end

def adjust_input(file)
  CSV.read(file)[0][0]
end

# p calculate('./lib/day06/input.csv', true)
# p calculate_02('./lib/day06/input.csv', true)
