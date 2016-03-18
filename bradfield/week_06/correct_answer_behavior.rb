class CorrectAnswerBehavior

  def initialize seed = nil
    srand(seed) if seed
    @players = %w[Alice Bob Cecil]
    @purses = @players.map { rand(3) + 2 }
    @in_penalty_box = @players.map { rand(2) == 0 }
    @current_player_index = rand(@players.count)
    @is_getting_out_of_penalty_box = player_in_penalty_box? && rand(2) == 0
  end

  def was_correctly_answered
    if player_in_penalty_box? && !@is_getting_out_of_penalty_box
      puts "#{player_name} stays in penalty box"
      rotate_current_player()
      puts "Player is now #{player_name}"
      return true
    end

    if @is_getting_out_of_penalty_box
      puts "#{player_name} got out of penalty box"
    end

    puts 'Answer was correct!!!!'
    self.player_gold_coins += 1
    puts "#{player_name} now has #{player_gold_coins} Gold Coins."
    winner = player_gold_coins != 6
    rotate_current_player()
    puts "Player is now #{player_name}"
    winner
  end

  protected

  def player_gold_coins=(value)
    @purses[@current_player_index] = value
  end

  def player_gold_coins
    @purses[@current_player_index]
  end

  def player_in_penalty_box?
    @in_penalty_box[@current_player_index]
  end

  private

  def rotate_current_player
    @current_player_index += 1
    @current_player_index = 0 if @current_player_index == @players.length
  end

  def player_name
    @players[@current_player_index]
  end
end
