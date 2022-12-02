def calculate_score(input)
  arr = adjust_input(input)
  player_score = 0
  arr.each do |pair|
    player_score += check_game_outcome(pair[0], pair[1])
    player_score += check_choice_score(pair[1])
  end
  player_score
end

def adjust_input(string)
  arr = string.split("\n")
  arr.map! { |element| element.split(' ') }
  arr.map! do |pair|
    pair.map! do |item|
      if item == 'A' || item == "X"
        'rock'
      elsif item == 'B' || item == "Y"
        'paper'
      else
        'scissors'
      end
    end
  end
  arr
end

def check_game_outcome(oponent, player)
  if oponent == player
    3
  elsif (oponent == 'rock') && (player == 'paper')
    6
  elsif (oponent == 'paper') && (player == 'scissors')
    6
  elsif (oponent == 'scissors') && (player == 'rock')
    6
  else
    0
  end
end

def check_choice_score(player)
  case player
  when 'rock'
    1
  when 'paper'
    2
  when 'scissors'
    3
  end
end
