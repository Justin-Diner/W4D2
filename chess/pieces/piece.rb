class Piece
	attr_reader: :pos, :color
	def initialize(board, pos, color = "black")
		@board = board
		@pos = pos
		@color = color
	end

	def empty?
	end

	def valid_moves
	end

	def pos=(val)
	end
	
	def inspect
		"Piece"
	end

	private 
	def move_into_check?(end_pos)
	end
end