# Rock, Paper, Scissors
def break_condition(input)
  return (input == 'quit' || input == 'exit' || input == 'q' || input == 'e')
end

def acceptable_move(input)
  return (is_move_rock(input) || is_move_paper(input) || is_move_scissors(input))
end

def is_move_rock(input)
  return (input == 'rock' || input == 'r' || input == '2')
end

def is_move_paper(input)
  return (input == 'paper' || input == 'p' || input == '1')
end

def is_move_scissors(input)
  return (input == 'scissors' || input == 's' || input == '3')
end

puts "Welcome to rock, paper, scissors!"
puts ''

player_move = ''
win_tally = 0
loss_tally = 0
tie_tally = 0
player_move_num = 0
computer_move = ''

puts "Your move: rock, paper, or scissors?"
player_move = gets.chomp.downcase

while !(break_condition(player_move))
  if !(acceptable_move(player_move))
    puts "You blew it. Try again: is your move rock, paper, or scissors?"

  else
    if is_move_rock(player_move)
      player_move_num = 0
      player_move = 'Rock'
    elsif is_move_paper(player_move)
      player_move_num = 1
      player_move = 'Paper'
    else
      player_move_num = 2
      player_move = 'Scissors'
    end

    computer_move_num = rand(3)

    if computer_move_num == 0
      computer_move = 'Rock'
    elsif computer_move_num == 1
      computer_move = 'Paper'
    else
      computer_move = 'Scissors'
    end

    puts ''
    puts 'You played: ' + player_move
    puts 'The computer played: ' + computer_move
    puts ''

    if player_move_num == computer_move_num
      puts 'It\'s a tie!'
      tie_tally += 1
    elsif (player_move_num == computer_move_num-1 && player_move_num != 2) || (player_move_num == 2 && computer_move_num == 0)
      puts 'You lose :('
      loss_tally += 1
    else
      puts 'You win!! WOOO!'
      win_tally += 1
    end

    puts ''
    puts "Your move: rock, paper, or scissors?"
  end

  player_move = gets.chomp.downcase
end

puts ''
puts 'Game\'s over.'
puts 'The final tally is:'
puts 'Your wins: ' + win_tally.to_s
puts 'Your losses: ' + loss_tally.to_s
puts 'Your ties: ' + tie_tally.to_s
