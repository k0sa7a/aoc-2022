def calculate(food)
  current_best = 0
  current_value = 0
  arr = food.split("\n")
  arr << ''
  arr.each do |element|
    if element == ''
      current_best = current_value > current_best ? current_value : current_best
      current_value = 0
    end
    current_value += element.to_i
  end
  current_best
end

def calculate_top_three(food)
  current_value = 0
  arr = food.split("\n")
  arr << ''
  arr_sum = []
  arr.each do |element|
    if element == ''
      arr_sum << current_value
      current_value = 0
    else
      current_value += element.to_i
    end
  end
  high = arr_sum.max
  arr_sum.delete_at(arr_sum.index(high))
  mid = arr_sum.max
  arr_sum.delete_at(arr_sum.index(mid))
  low = arr_sum.max
  high + mid + low
end
