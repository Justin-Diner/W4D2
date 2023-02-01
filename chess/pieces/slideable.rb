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

	end

	private
	def move_dirs
		# subclass implements this
		raise NotImplementedError # this only executes if 
	end

	grow_unblocked_moves_in_dir(dx, dy)
	end

end