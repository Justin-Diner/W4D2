module Slideable

	HORIZONTAL_DIRS = [
		[0, -1], # left
		[0, 1], # right
		[-1, 0], # up 
		[1, 0] # down
	].freeze

	DIAGONAL_DIRS = [
		[-1, -1], #up + left
		[-1, 1], #up + right
		[1, -1], #down + left
		[1, 1] #down + right
	].freeze

	def horizontal_dirs 
		# getter for HORIZONTAL_DIRS
		HORIZONTAL_DIRS.dup
	end

	def diagonal_dirs 
		# getter for DIAGONAL_DIRS
		DIAGONAL_DIRS.dup
	end

	def moves
		# create array to collect moves
		possible_moves = []

		self.move_dirs.each do |dx, dy|
			possible_moves += grow_unblocked_moves_in_dir(dx, dy)
		end

		possible_moves

		# iterate over each of the directions in which a slideable piece can move
		  # use the Piece subclass' `#move_dirs` method to get this info
		  # for each direction, collect all possible moves in that direction
			# and add them to your moves array 
			# (use the `grow_unblocked_moves_in_dir` helper method)
	
		# return the final array of moves (containing all possible moves in all directions)
	
	  end

	private
	def move_dirs
		# subclass implements this
		raise NotImplementedError # this only executes if 
	end

	def grow_unblocked_moves_in_dir(dx, dy)
		  # create array to collect moves
		collection = []
	
		# get the piece's current row and current column
		self_row = self.pos[0]
		self_col = self.pos[1]
		# in a loop:
		  # continually increment the piece's current row and current column to generate a new position
		possible_row = self_row + dx
		possible_col = self_col + dy
		while possible_row < 8 && possible_col < 8 && possible_row > 0 && possible_col > 0
		
			if !self.board[[possible_row, possible_col]].is_a?(Piece)
				collection << [possible_row, possible_col]
			end 
			possible_row += dx
			possible_col += dy
		end

		collection
		  # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
		  # if the new position is empty, the piece can move here, so add the new position to the moves array
		  # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
			# but, the piece cannot continue to move past this piece, so stop looping
		  # if the new position is occupied with a piece of the same color, stop looping
	
		# return the final moves array
	end

end