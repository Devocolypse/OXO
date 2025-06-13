# Board class
class Board
  attr_reader :state

  def initialize
    @state = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    @move_count = 0
  end

  def update(row, col, symbol)
    return unless @state[row][col].is_a? Integer

    @state[row][col] = symbol
    @move_count += 1
    @state
  end
end
