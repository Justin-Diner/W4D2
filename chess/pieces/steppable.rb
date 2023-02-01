module Stepable
	def moves

	end

	private
	def move_diffs
		# subclass implements this
		raise NotImplementedError
	end
end