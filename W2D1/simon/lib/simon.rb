require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)

  # COLORS = [
  #   "red".colorize(:red),
  #   "blue".colorize(:blue),
  #   "yellow".colorize(:yellow),
  #   "green".colorize(:green)
  # ]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1)
    @sequence_length = sequence_length
    @game_over = false
    @seq = []
    @count = 0
  end

  def play
    until game_over?
      take_turn
    end
    game_over_message
    play_again
  end

  def play_again
    reset_game
    play
  end

  def take_turn
    show_sequence

    sleep 5
    system("clear")

    require_sequence
    if @game_over == false
      @count += 1
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    puts "Here is your color sequence, try to remember (you have 5 sec)"
    add_random_color
    display
  end

  def display
    @seq.each do |el|
      case el
      when "red"
        puts "red".colorize(:red)
      when "blue"
        puts "blue".colorize(:blue)
      when "yellow"
        puts "yellow".colorize(:yellow)
      when "green"
        puts "green".colorize(:green)
      end
    end
  end

  def require_sequence
    p "Please repeat that sequence, separated by a space: "
    input = gets.chomp.split(" ")
    check_sequence(input)
  end

  def add_random_color
    colors = COLORS
    color = colors.sample
    # color = colors.sample.to_s
    @seq << color
  end

  def round_success_message
    puts ""
    puts "You got #{@count} right!!!"
  end

  def game_over?
    @game_over
  end

  def game_over_message
    puts ""
    puts "You lost, loser!!!"
  end

  def check_sequence(guess)
    if guess != @seq
      @game_over = true
    end
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    @count = 0
  end
end

if $PROGRAM_NAME == __FILE__
  Simon.new(1).play
end
