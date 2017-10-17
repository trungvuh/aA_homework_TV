class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each do |i|
      4.times {@cups[i] << :stone} unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0, 13)
  end

  def make_move(start_pos, current_player_name)
    count = @cups[start_pos].length

    @cups[start_pos] = []
    next_pos = start_pos + 1
    skip = current_player_name == @name1 ? 13 : 6

    until count == 0
      next_pos = next_pos % @cups.size
      unless next_pos == skip
        @cups[next_pos] << :stone
        count -= 1
      end
      next_pos += 1
    end

    ending_pos = next_pos - 1

    render
    next_turn(ending_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine what #make_move returns
    store = current_player_name == @name1 ? 6 : 13

    if ending_cup_idx == store
      puts "You end up at your store point"
      :prompt
    else
      if @cups[ending_cup_idx].length == 1
        :switch
      else
        ending_cup_idx
      end
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    arr1, arr2 = [], []
    (0..5).each { |i| arr1 << @cups[i].length }
    (7..12).each { |j| arr2 << @cups[j].length }

    return true if arr1.reduce(:+) == 0 || arr2.reduce(:+) == 0
    false
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end
