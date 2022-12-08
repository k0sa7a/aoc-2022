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

def set_visible_and_score_on_outside_trees(arr)
  arr.first.each do |tree|
    tree.visible = true
    tree.score = 0
  end

  arr.last.each do|tree|
    tree.visible = true
    tree.score = 0
  end

  arr.each do |inner_arr|
    inner_arr.first.visible = true
    inner_arr.last.score = 0
  end
  arr
end

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
          tree.visible = false
        end
      end
    end
  end
end

def set_score_on_inner_trees(arr)
  arr.each do |row|
    row.each do |tree|
      if tree.score == "?"
        final_score = 0

        left_score = 0
        right_score = 0
        up_score = 0
        down_score = 0

        to_check = row.map {|tr| tr.height}
        left = to_check[0...row.find_index(tree)]
        right = to_check[(row.find_index(tree) + 1)..(row.size - 1)]
        up = []
        down = []
        for i in 0..(arr.size) -1
          for n in 0..(arr[i].size) -1
              if (n == row.find_index(tree))
                if (i < arr.find_index(row))
                  up << arr[i][n].height
                elsif (i > arr.find_index(row))
                  down << arr[i][n].height
                end
              end
          end
        end
        left_check = left.all? {|value| value < tree.height}
        if left_check
          left_score += (left.size)
        else
          left.reverse_each do |t|
            left_score += 1
             if t >= tree.height
              break
            end
          end
        end

        right_check = right.all? {|value| value < tree.height}
        if right_check
          right_score += (right.size)
        else
          right.each do |t|
            right_score += 1
            if t >= tree.height
             break
           end
         end
        end

        up_check = up.all? {|value| value < tree.height}
        if up_check
          up_score += (up.size)
        else
          up.reverse_each do |t|
            up_score += 1
            if t >= tree.height
             break
           end
         end
        end

        down_check = down.all? {|value| value < tree.height}
        if down_check
          down_score += (down.size)
        else
          down.each do |t|
            down_score += 1
            if t >= tree.height
             break
           end
         end
        end
        final_score = left_score * right_score * up_score * down_score
        tree.score = final_score
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

def find_best_score(arr)
  best = 0
  arr.each do |row|
    row.each do |tree|
      best = tree.score if tree.score > best
    end
  end
  best
end

# Part 01
# arr = adjust_input('lib/day08/input.csv')
# arr_visib = set_visible_and_score_on_outside_trees(arr)
# set_visible_on_inner_trees(arr_visib)
# p calculate_visible(arr_visib)

# Part 02
# arr = adjust_input('lib/day08/input.csv')
# arr_visib = set_visible_and_score_on_outside_trees(arr)
# set_score_on_inner_trees(arr_visib)
# p find_best_score(arr_visib)
