# Board class
class Board
  attr_reader :state

  def initialize
    @state = (1..9).to_a
  end

  def update(turn)
    position, symbol = turn

    i = @state.find_index(position)

    return unless i.is_a? Integer

    @state[i] = symbol
    @state
  end
end
