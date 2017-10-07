# require 'colorize'

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

    sleep 3
    system("clear")

    require_sequence
    if @game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    puts "Here is your color sequence, try to remember (you have 3sec)"
    add_random_color
    puts @seq
  end

  def require_sequence
    p "Please repeat that sequence, separated by comma (no space): "
    input = gets.chomp.split(",")
    if input != @seq
      @game_over = true
    end
  end

  def add_random_color
    colors = COLORS
    color = colors.sample
    @seq << color
  end

  def round_success_message
    puts ""
    puts "You got it right!!!"
  end

  def game_over?
    @game_over
  end

  def game_over_message
    puts ""
    puts "You lost, loser!!!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if $PROGRAM_NAME == __FILE__
  Simon.new(1).play
end
