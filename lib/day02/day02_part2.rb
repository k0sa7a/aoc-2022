def calculate_score(input)
  arr = adjust_input(input)
  player_score = 0
  arr.each do |pair|
    player_score += check_game_outcome(pair[1])
    player_score += check_choice_score(pair[0], pair[1])
  end
  player_score
end

def adjust_input(string)
  arr = string.split("\n")
  arr.map! { |element| element.split(' ') }
  arr.map! do |pair|
    pair.map! do |item|
      case item
      when 'A'
        'rock'
      when 'B'
        'paper'
      when 'C'
        'scissors'
      when 'X'
        'lose'
      when 'Y'
        'draw'
      when 'Z'
        'win'
      end
    end
  end
  arr
end

def check_choice_score(oponent, outcome)
  case outcome
  when 'draw'
    draw_helper(oponent)
  when 'win'
    win_helper(oponent)
  when 'lose'
    lose_helper(oponent)
  end
end

def draw_helper(oponent)
  case oponent
  when 'rock'
    1
  when 'paper'
    2
  when 'scissors'
    3
  end
end

def win_helper(oponent)
  case oponent
  when 'rock'
    2
  when 'paper'
    3
  when 'scissors'
    1
  end
end

def lose_helper(oponent)
  case oponent
  when 'rock'
    3
  when 'paper'
    1
  when 'scissors'
    2
  end
end

def check_game_outcome(outcome)
  case outcome
  when 'draw'
    3
  when 'win'
    6
  when 'lose'
    0
  end
end

p calculate_score(input)
