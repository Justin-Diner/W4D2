require_relative 'piece.rb'
require_relative 'slideable.rb'

class Queen < Piece
	include Slideable

	def symbol
		'♛'
	end

	def move_dirs
		all_moves = []
		all_moves += horizontal_dirs
		all_moves += diagonal_dirs
	end

end