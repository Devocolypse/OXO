# Player class
class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def play_at(row, col)
    [row, col, @symbol]
  end
end
