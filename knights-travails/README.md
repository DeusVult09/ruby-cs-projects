Pseudocode:
Define a list of the 8 possible knight movements and store thenm in a constant variable

Define a function "legal_moves(square)" that:
  - Takes the current square('vertices'), 
  represented like [x, y] where x and y are between 0 and 7
  - Applies all 8 moves 
  - Keeps only those that stay on the board ("edges")
  - Returns them

Define "knight_moves(start_pos, target_pos)" that (finds the fastest path to the end destination):
  - uses a bfs approach to travers accros the board
  - Create a queue
  - Add [start, [start]]  (position + path taken)
  - Create a set of visited squares

  While the queue is not empty:
    Take the first element: current_square and current_path

    If current_square == target:
      Return current_path

    Otherwise:
      Get all valid moves from current_square
      For each move:
        If we have not visited it:
          Mark it visited
          Add it to the queue, with its path appended

Call knight_moves(start_pos, target_pos)
Print the path and number of moves