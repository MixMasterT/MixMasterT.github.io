class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @game_over = false
    @sequence_length = 1 #This seems counter-intuitive and causes extra value problem later...
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
    require_sequence
    #system('clear')
    round_success_message unless @game_over
    increment_sequence_length
  end

  def increment_sequence_length
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    system("clear")
    puts "Now pay attention to the sequence!"
    sleep(1)
    system("clear")
    @seq.each { |v| print "#{v} " }
    sleep(2)
    system("clear")
  end

  def require_sequence
    puts "Please type in a single letter for each color in the sequence..."
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
    @game_over = true unless guess == @seq
  end

  def add_random_color
    @seq << COLORS[rand(4)]
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
