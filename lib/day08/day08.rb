require 'csv'
require_relative 'Tree'

def adjust_input(file_path)
  arr = []
  CSV.foreach(file_path, headers:false) do |row|
    array_of_values = row[0].split('')
    array_of_values.map! do |height|
      Tree.new(height)
    end
    arr << array_of_values
  end
  arr
end

def set_visible_on_outside_trees(arr)
  arr.first.each{|tree| tree.visible = true}
  arr.last.each{|tree| tree.visible = true}
  arr.each do |small_arr|
    small_arr.each do |tree|
      if small_arr.first == tree || small_arr.last == tree
        tree.visible = true
      end
    end
  end
  arr
end

def helper_visualise(arr)
  arr.each do |small_arr|
    small_arr.each{|tree| print "#{tree.height}      "}
    puts "\n \n"
  end
  puts "<------------->"
  arr.each do |small_arr|
    small_arr.each{|tree| print "#{tree.visible}  "}
    puts "\n \n"
  end
end

def set_visible_on_inner_trees(arr)
  for i in 0..(arr.size) -1
    if i > 0 && i < (arr.size) - 1
      for n in 0..(arr[i].size) -1
        if n > 0 && n < (arr[i].size) -1
          here we check if the innter trees will be visible based on all the trees from them
          to the outside
          we can to ranges
        end
      end
    end
  end
end


arr = adjust_input('lib/day08/test.csv')
arr_visib = set_visible_on_outside_trees(arr)
# p adjust_input('lib/day08/test.csv')
helper_visualise(arr_visib)
set_visible_on_inner_trees(arr_visib)
