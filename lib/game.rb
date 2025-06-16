require_relative "player"
require_relative "board"
require_relative "winning"

# Game class
class Game
  include Winning

  def initialize
    @player_x = Player.new("X")
    @player_o = Player.new("O")
    @board = Board.new
    @move_count = 0
    @winner = nil
  end

  def ask
    @board.render
    puts "Where would you like to play?"
    gets.chomp.to_i
  end

  def check_winner(row, col, player)
    board = @board.state
    symbol = player.symbol

    @winner = player if winnable?(row, col, board, symbol)
  end

  private

  def winnable?(row, col, board, symbol)
    check_col(row, board, symbol) ||
      check_row(col, board, symbol) ||
      check_diag(board, symbol) ||
      check_anti_diag(board, symbol)
  end
end
