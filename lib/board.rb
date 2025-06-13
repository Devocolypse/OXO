# Board class
class Board
  attr_reader :state

  def initialize
    @state = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    @move_count = 0
  end

  def render
    d = @state.flatten.map { |pos| pos + 1 }

    puts <<-BOARD
      #{d[0]} | #{d[1]} | #{d[2]}
     ---+---+---
      #{d[3]} | #{d[4]} | #{d[5]}
     ---+---+---
      #{d[6]} | #{d[7]} | #{d[8]}
    BOARD
  end

  def update(row, col, symbol)
    return unless @state[row][col].is_a? Integer

    @state[row][col] = symbol
    @state
  end
end
