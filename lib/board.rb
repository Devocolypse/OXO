# Board class
class Board
  attr_reader :state

  def initialize
    @state = (1..9).to_a
  end

  def update(turn)
    position, symbol = turn

    @state.map! { |pos| pos == position ? symbol : pos }
  end
end
