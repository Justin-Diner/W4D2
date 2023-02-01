require_relative 'pieces/pieces.rb'

class Board 
	attr_reader :rows

	def initialize
		@rows = self.fill_rows
	end

	def fill_rows
		board = Array.new(8) {Array.new(8)}

		board.each_with_index do |subArr, i|
			(0...board.length).each do |j|
				if i == 0 
					board[i][0], board[i][7] = Rook.new(self,[i,0]), Rook.new(self,[i,7]) 
				elsif i == 1 || i == 6 
					board[i].fill(Piece.new(self, [i, j]))
				elsif i == 7
					board[i][0], board[i][7] = Rook.new(self,[i,0]), Rook.new(self,[i,7])
				end
			end
		end
		board
	end

	def [](pos)
		row, col = pos
		#row = pos[0]
		#column = pos[1]
		rows[row][col]
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