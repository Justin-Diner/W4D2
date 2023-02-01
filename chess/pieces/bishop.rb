require_relative 'slideable.rb'
require_relative 'piece.rb'

class Bishop < Piece
	include Slideable

	def symbol
		'♝'
	end

	def move_dirs
		rook_moves = diagonal_dirs
	end
end