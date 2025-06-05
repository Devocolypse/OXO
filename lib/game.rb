require_relative "player"
require_relative "board"

# Game class
class Game
  def initialize
    @player_x = Player.new("X")
    @player_o = Player.new("O")
    @board = Board.new
  end
end