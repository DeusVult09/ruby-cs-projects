=begin
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
=end

class Knight
  VALID_MOVES = [[+2, +1], [+2, -1], [-2, +1], [-2, -1], 
  [+1, +2], [+1, -2], [-1, +2], [-1, -2]]
  
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def legal_moves(curr_square)
    x = square[0] #defining a horizontal axis in a square
    y = square[1] #defining a vertical axis

    moves = [] #creating an array of legal moves

    VALID_MOVES.each do |px, py| #every valid move is visited. 
      new_x = x + px #we are applying valid moves and calculating candidate square for legal moves
      new_y = y + py #storing in new variables

      if new_x.between?(0..7) && new_y.between?(0..7) 
        moves << [new_x, new_y] #only if moves are within board edges add them to a legal moves list
      end
    end
    moves #return them
  end

  def knight_moves(start_pos, target_pos) 
    queue = [[start_pos]]
    visited_paths = []

    while !queue.empty?
      current_path = queue.shift
      curr_square = current_path.last
      possible_moves = legal_moves(curr_square)

      if curr_square == target_pos
        puts "You made it in #{current_path.length - 1}! Here is your path: #{current_path}"
        return current_path
      else
        possible_moves.each do |position|
          next if visited_paths.include?(position)
          visited_paths << position
          new_path = current_path + [position]
          queue << new_path
        end
      end
    end
  end
end