require "./player"
require "./generate_question"

class Game
  attr_accessor :p1, :p2, :current_player, :game_over
  attr_reader :question

  def initialize(p1_name, p2_name)
    @p1 = Player.new(p1_name)
    @p2 = Player.new(p2_name)
    @game_over = false
    @question = Question.new
    @current_player = p1
  end

  def start
    question.ask(current_player)    
    answer = $stdin.gets.chomp.to_i
    if (!question.check_answer(answer))
      current_player === p1 ? p1.lose_life : p2.lose_life
      if p1.life == 0 || p2.life == 0
        self.game_over = true
      end
      show_message(false)
    else
      show_message(true)
    end
    question.refresh    
    start
  end

  def show_message(correct)
    puts correct ? "#{current_player.name}: YES! You are correct." : "#{current_player.name}: Seriously? No!"    
    puts "#{p1.name}: #{p1.score} vs #{p2.name}: #{p2.score}"   
    if (game_over)
      puts current_player.name == p1.name ? "#{p2.name} wins with a score of #{p2.score}" : "#{p1.name} wins with a score of #{p1.score}"
      puts "----- GAME OVER -----"
      puts "Good bye!"
      exit(0)
    else
      puts "----- NEW TURN -----"
      change_player
    end
  end

  def change_player
    if (current_player.name == p1.name)
      self.current_player = p2
    else
      self.current_player = p1
    end
  end
end