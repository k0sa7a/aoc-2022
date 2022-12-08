require 'csv'
require_relative 'Tree'
require 'pry-byebug'

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


# def set_visible_on_inner_trees_all_sides(arr)
#   arr.each do |row|
#     row.each do |tree|
#       if tree.visible == "????"
#         to_check = row.map {|tr| tr.height}
#         to_check.delete_at(row.find_index(tree))
#         for i in 0..(arr.size) -1
#           for n in 0..(arr[i].size) -1
#             if (i < arr.find_index(row)) || (i > arr.find_index(row))
#               if (n == row.find_index(tree))
#                 to_check << arr[i][n].height
#               end
#             end
#           end
#         end
#         tree.visible = to_check.all? {|value| value < tree.height}
#       end
#     end
#   end
# end

def set_visible_on_inner_trees(arr)
  arr.each do |row|
    row.each do |tree|
      if tree.visible == "????"
        to_check = row.map {|tr| tr.height}
        left = to_check[0...row.find_index(tree)]
        right = to_check[(row.find_index(tree) + 1)..(row.size - 1)]
        up = []
        down = []
        for i in 0..(arr.size) -1
          for n in 0..(arr[i].size) -1
              if (n == row.find_index(tree))
                to_check << arr[i][n].height
                if (i < arr.find_index(row))
                  up << arr[i][n].height
                elsif (i > arr.find_index(row))
                  down << arr[i][n].height
                end
              end
          end
        end
        left_check = left.all? {|value| value < tree.height}
        right_check = right.all? {|value| value < tree.height}
        up_check = up.all? {|value| value < tree.height}
        down_check = down.all? {|value| value < tree.height}
        if left_check == true || right_check == true || up_check == true || down_check == true
          tree.visible = true
        else
          tree.visible = "fals"
        end
      end
    end
  end
end

def calculate_visible(arr)
  sum = 0
  arr.each do |row|
    row.each do |tree|
      if tree.visible == true
        sum += 1
      end
    end
  end
  sum
end

arr = adjust_input('lib/day08/input.csv')
arr_visib = set_visible_on_outside_trees(arr)
# p adjust_input('lib/day08/test.csv')
# helper_visualise(arr_visib)
set_visible_on_inner_trees(arr_visib)
# helper_visualise(arr_visib)
p calculate_visible(arr_visib)
