# Board class
class Board
  attr_reader :state, :cords

  def initialize
    @state = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    @cords = generate_cords
  end

  def render
    d = @state.flatten.map { |pos| pos.is_a?(Integer) ? pos + 1 : pos }

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

  private

  def generate_cords
    h = {}
    @state.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        h[col + 1] = [row_i, col_i]
      end
    end
    h
  end
end
