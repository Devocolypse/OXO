require_relative "player"
require_relative "board"
require_relative "winning"

# Game class
class Game
  include Winning
  attr_reader :player_x, :player_o, :board, :move_count, :winner

  def initialize
    @player_x = Player.new("X")
    @player_o = Player.new("O")
    @current_player = @player_x
    @board = Board.new
    @move_count = 0
    @winner = nil
  end

  def run
    # main game loop
    until game.winner
      # display the board
      board.render
      # ask the current_player for their move
      choice = game.ask
      # validate the move
      #   - must be an integer
      #   - must not be occupied
      # increment move_count by one
      # check for a winner when a min of 5 moves have been made
      # if a winner has been found, update game.winner and congratulate them!
      # if 9 moves have been made but there is no winner, the game is a draw
      # else, change current_player - loop continues
    end
  end

  def fetch_valid_pos
    positions = []
    @board.state.map do |row|
      row.map { |col| positions.push(col + 1) if col.is_a? Integer }
    end
    positions
  end

  def fetch_valid_int
    begin
      input = gets.chomp.match(/\b[1-9]\b/)[0]
    rescue StandardError
      puts "Must be a number between 1 and 9."
      retry
    end
    input.to_i
  end

  def fetch_valid_choice
    begin
      choice = fetch_valid_int
      valid_pos = fetch_valid_pos
      raise StandardError unless valid_pos.include?(choice)
    rescue StandardError
      puts "That spot is already taken!"
      retry
    end
    @board.cords[choice]
  end

  def ask
    @board.render
    puts "\nEnter the number of the position you'd like to play at>>"
    fetch_valid_choice
  end

  def check_winner(row, col, player)
    board = @board.state
    symbol = player.symbol

    @winner = player if winnable?(row, col, board, symbol)
  end

  def winnable?(row, col, board, symbol)
    check_col(row, board, symbol) ||
      check_row(col, board, symbol) ||
      check_diag(board, symbol) ||
      check_anti_diag(board, symbol)
  end

  def opposite_player
    @current_player == @player_x ? @player_o : @player_x
  end
end
