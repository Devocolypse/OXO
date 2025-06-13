# helper module for checking winning board states
module Winning
  BOARD_SIZE = 3

  def check_col(row, board, symbol)
    i = 0
    while i < BOARD_SIZE
      break unless board[row][i] == symbol

      winning = (i == BOARD_SIZE - 1)
      i += 1
    end
    winning
  end

  def check_row(col, board, symbol)
    i = 0
    while i < BOARD_SIZE
      break unless board[i][col] == symbol

      winning = (i == BOARD_SIZE - 1)
      i += 1
    end
    winning
  end

  def check_diag(board, symbol)
    i = 0
    while i < BOARD_SIZE
      break unless board[i][i] == symbol

      winning = (i == BOARD_SIZE - 1)
      i += 1
    end
    winning
  end

  def check_anti_diag(board, symbol)
    i = 0
    while i < BOARD_SIZE
      anti_i = (BOARD_SIZE - 1) - i
      break unless board[i][anti_i] == symbol

      winning = (i == BOARD_SIZE - 1)
      i += 1
    end
    winning
  end
end
