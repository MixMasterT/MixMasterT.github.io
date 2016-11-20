class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @game_over = false
    @sequence_length = 0 #This seems counter-intuitive and causes extra value problem later...
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    @game_over = true unless require_sequence
    round_success_message unless @game_over
  end

  def show_sequence
    add_random_color
    @seq.each { |v| p v }
  end

  def require_sequence
    guess = gets.chomp.split("").map do |letter|
      case letter
      when 'r'
        'red'
      when 'b'
        'blue'
      when 'g'
        'green'
      when 'y'
        'yellow'
      end
    end
    guess == @seq
  end

  def add_random_color
    new_color = COLORS[rand(4)]
    @seq << new_color
    @sequence_length += 1
  end

  def round_success_message
    puts "Good job! You had no trouble with #{@sequence_length} colors. Now, let's add one more!~)"
  end

  def game_over_message
    puts "Too bad, it looks like #{@sequence_length} colors proved one too many."
  end

  def reset_game
    initialize
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Simon.new
  g.play
end
