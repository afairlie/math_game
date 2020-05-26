
class Game
  attr_accessor :p1, :p2
  def initialize p1, p2
    @p1 = p1
    @p2 = p2
  end

  def play
    current_player = p1
    while p1.lives > 0 && p2.lives > 0 do
      round current_player
      current_player == p1 ? current_player = p2 : current_player = p1
      if p1.lives == 0
        winner p2
      elsif p2.lives == 0
        winner p1
      else
        puts "P1: #{p1.lives}/3 vs P2: #{p2.lives}/3"
        puts "---- NEW TURN ----"
      end
    end
  end

  def round player
    n1 = rand(20)
    n2 = rand(20)
    answer = n1 + n2
    puts "#{player.name}: What does #{n1} plus #{n2} equal?"
    player_answer = get_answer.to_i
    puts check_answer(player, player_answer, answer)
  end

  def get_answer
    print "> "
    gets.chomp
  end

  def check_answer player, p_answer, answer
    if p_answer == answer
      "#{player.name}: YES! You are correct. #{answer}"
    else
      player.lives -= 1
      "#{player.name}: Seriously? No! #{answer}" 
    end
  end

  def winner winning_player
    puts "#{winning_player.name} wins with a score of #{winning_player.lives}/3"
    puts "---- GAME OVER ----"
    puts "Good bye!"
  end
end