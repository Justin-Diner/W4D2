require_relative 'piece.rb'

class Board 
	attr_reader :rows

	def initialize
		@rows = self.fill_rows
	end

	def fill_rows
		board = Array.new(8) {Array.new(8)}

		board.each_with_index do |subArr, idx|
			if idx == 0 || idx == 1 || idx == 6 || idx == 7
				board[idx].fill(Piece.new)
			end
		end
		board
	end

	def [](pos)
		row = pos[0]
		column = pos[1]
		rows[row][column]
	end

	def []=(pos, value)
		row = pos[0]
		column = pos[1]
		rows[row][column] = value
	end

	def move_piece(start_pos, end_pos)
		start_row = start_pos[0]
		start_col = start_pos[1]
		end_row = end_pos[0]
		end_col = end_pos[1]

		if rows[start_row][start_col] == nil || !rows[start_row][start_col].is_a?(Piece)
			raise 'Not a Piece'
		elsif end_row > 7 || end_row < 0 || end_col < 0 || end_col > 7
			 raise 'Target Position Outside of Board'
		else 
			rows[end_row][end_col] = rows[start_row][start_col]
			rows[start_row][start_col] = nil
			return true
		end
	end
end