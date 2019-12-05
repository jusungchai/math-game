require "./player"
require "./generate_number"

$p1 = Player.new("Jay")
$p2 = Player.new("Dom")

$num1 = Number.new
$num2 = Number.new

def start
  puts "#{$p1.name}: What does #{$num1.number} + #{$num2.number} equal?"  
  print "> "
  answer = $stdin.gets.chomp.to_i
  
  if (!check_answer(answer)) 
    $p1.life -= 1
  end
  
  new_turn($p1)
end

def update_player_life(current_player)
  current_player.name == $p1.name ? $p1.life = current_player.life : $p2.life = current_player.life
end

def change_player(current_player)
  return current_player.name == $p1.name ? $p2 : $p1
end

def check_answer(answer)
  puts (answer == $num1.number + $num2.number) ? "YES! You are correct." : "Seriously? No!"
  return (answer == $num1.number + $num2.number)
end

def new_turn(current_player)
  if (current_player.life == 0)
    current_player = change_player(current_player)
    puts "#{current_player.name} wins with a score of #{current_player.life}/3" 
    exit(0)
  else
    puts "#{$p1.name}: #{$p1.life}/3 vs #{$p2.name}: #{$p2.life}/3"
  end

  current_player = change_player(current_player)
  puts
  puts "----- NEW TURN -----"

  puts "#{current_player.name}: What does #{$num1.refresh} + #{$num2.refresh} equal?"
  print "> "
  answer = $stdin.gets.chomp.to_i 

  if (!check_answer(answer)) 
    current_player.life -= 1
    update_player_life(current_player)
  end

  new_turn(current_player)
end

start