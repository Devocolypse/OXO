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
  end

  def check_winner(row, col, symbol)
    board = @board.state
    check_col(row, board, symbol)
    check_row(col, board, symbol)
    check_diag(board, symbol) if row == col
    check_anti_diag(board, symbol) if row + col == 2
  end
end
