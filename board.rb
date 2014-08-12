class Game
	# Board class
	class Board

		attr_accessor :squares
		attr_reader :winning_rows

		# initializes the square indices and possible rows
		def initialize
			@squares = []

			9.times { @squares << '-' }

			update
		end

		# updates the possible rows with the symbol values
		def update
			@winning_rows = []

			8.times { @winning_rows << [] }

			3.times do |i|
				3.times do |j|
					@winning_rows[i] << @squares[3 * i + j]
				end
			end

			3.times do |i|
				3.times do |j|
					@winning_rows[i+3] << @squares[i + 3 * j]
				end
			end

			[0,4,8].each do |i|
				@winning_rows[6] << @squares[i]
			end

			[2,4,6].each do |i|
				@winning_rows[7] << @squares[i]
			end
		end

		# prints out the board
		def display
			shown = "\n   TIC TAC TOE\n       a b c"
			3.times do |i|
				shown << "\n     #{i + 1} "
				(3 * i).upto(3 * i + 2) { |j| shown << (@squares[j] + " ") }
			end
			shown << "\n "
			puts shown
		end

	end
end