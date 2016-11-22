require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1, @name2 = name1, name2
    place_stones
  end

  def place_stones
    @cups[0..5].each { |c| 4.times { |_| c << :stone } }
    @cups[7..12].each { |c| 4.times { |_| c << :stone } }
  end

  def valid_move?(start_pos)
    valid_starting_cups = [1,2,3,4,5,7,8,9,10,11,12]
    unless valid_starting_cups.include?(start_pos)
      raise "Invalid starting cup"
    end
    true
  end

  def make_move(start_pos, current_player_name)
    opponent_cup = (current_player_name == @name2 ? 6 : 13)
    current_cup = start_pos
    @cups[start_pos].length.times do |_|
      stone = @cups[start_pos].pop
      current_cup += 1
      current_cup = 0 if current_cup == 14
      if current_cup == opponent_cup && current_cup == 13
        current_cup = 0
      elsif current_cup == opponent_cup
        current_cup += 1
      end
      @cups[current_cup] << stone
    end
    next_turn(current_cup)
    render
    own_cup = opponent_cup == 13 ? 6 : 13
    debugger
    return :switch if @cups[current_cup].empty?
    return :prompt if current_cup == own_cup
    current_cup
  end

  def next_turn(ending_cup_idx)
    #unnecessary and not useful without current_player_name
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    sides = [[0,1,2,3,4,5], [7,8,9,10,11,12]]
    sides.any? { |s| s.all? { |i| @cups[i].empty? } }
  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    else
      if @cups[6].length > @cups[13].length
        @name1
      else
        @name2
      end
    end
  end
end
