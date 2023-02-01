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
		move_dirs = []

		move_dirs.each do |dir|
			move_dirs << dir
		end
	
		# iterate over each of the directions in which a slideable piece can move
		  # use the Piece subclass' `#move_dirs` method to get this info
		  # for each direction, collect all possible moves in that direction
			# and add them to your moves array 
			# (use the `grow_unblocked_moves_in_dir` helper method)
	
		# return the final array of moves (containing all possible moves in all directions)
	
		move_dirs
	  end

	private
	def move_dirs
		# subclass implements this
		raise NotImplementedError # this only executes if 
	end

	grow_unblocked_moves_in_dir(dx, dy)
	end

end