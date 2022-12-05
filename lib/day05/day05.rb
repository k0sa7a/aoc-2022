require 'csv'

def calculate(input_01, input_02)
  stacks = [[]]
  result = ""
  instructions = adjust_input_02(input_02)
  column_arr = adjust_input_01(input_01)
  column_arr.each {|column| stacks << column}

  instructions.each do |hash|
    hash[:times].times do
      container = stacks[hash[:start_arr]].shift
      stacks[hash[:end_arr]].unshift(container)
    end
  end
  stacks.delete_at(0)
  stacks.each {|stack| result << stack.first}
  result
end

def adjust_input_01(input_01)
  arr = []
  CSV.foreach(input_01) do |row|
    row[0].gsub!("[", " ")
    row[0].gsub!("]", " ")
    arr<<row[0].split("   ")
  end
  adjust_arrays(arr)
end

def adjust_arrays(arr)
  result = []
  arr[-1].length.times {result << []}
  arr.map do |small_arr|
    small_arr.map!{|str| str.strip}
  end
  arr.each do |row|
    row.each do |container|
      if container != ""
        result[row.index(container)] << container
        row[(row.index(container))] = ""
      end
    end
  end
  return result
end

def adjust_input_02(input_02)
  arr = []
  CSV.foreach(input_02, row_sep: "\n") do |row|
    hash = {}
    hash[:times] = row[0].scan(/move(.+)f/)[0][0].strip.to_i
    hash[:start_arr] = row[0].scan(/from(.+)t/)[0][0].strip.to_i
    hash[:end_arr] = row[0].scan(/to(.+)/)[0][0].strip.to_i
    arr << hash
  end
  arr
end

# p adjust_input_01('./lib/day05/input_01.csv')
# p adjust_input_02('./lib/day05/input_02.csv')
p calculate('./lib/day05/input_01.csv', './lib/day05/input_02.csv')
