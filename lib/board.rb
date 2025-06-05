class Board
  attr_writer :board_state

  def initialize
    @board_state = (1..9).to_a
  end
end
