class Question
  attr_accessor :num1, :num2

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def refresh
    self.num1 = rand(1..20)
    self.num2 = rand(1..20)
  end

  def ask(player)
    puts "#{player.name}: What does #{num1} + #{num2} equal?"
    print "> "
  end

  def check_answer(answer)
    return self.num1 + self.num2 === answer
  end
end