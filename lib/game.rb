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

  def play
    # main game loop
    until @winner || @move_count == 9
      # display the board
      @board.render
      # ask the current_player for their move
      row, col = ask
      # update board
      @board.update(row, col, @current_player.symbol)
      # increment move_count by one
      @move_count += 1
      # check for a winner when a min of 5 moves have been made
      check_winner(row, col, @current_player) if @move_count >= 5
      # else, change current_player - loop continues
      @current_player = opposite_player
    end
    win_msg
  end

  private

  def win_msg
    @board.render
    if @winner
      puts "Player #{@winner.symbol} wins!"
    else
      puts "Cats game!"
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
    puts "\nEnter a number, Player #{@current_player.symbol}>>"
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
