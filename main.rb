require_relative "lib/game"

game = Game.new
board = game.board
current_player = game.player_x

# main game loop
until game.winner
  # display the board
  board.render
  # ask the current_player for their move
  # validate the move
  #   - must be an integer
  #   - must not be occupied
  # increment move_count by one
  # check for a winner when a min of 5 moves have been made
  # if a winner has been found, update game.winner and congratulate them!
  # if 9 moves have been made but there is no winner, the game is a draw
  # else, change current_player - loop continues
end
