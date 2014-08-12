#This is the wrapper Game class for Tic Tac Toe
class Game

	def initialize
		@player = 1
		@tie = false
		@board = Board.new
	end

	def play
		10.times do
			@board.display
			if end_game
				unless @tie
					puts "Player #{@winner} wins!"
					return
				else
					puts "Cat's Game! (tie)"
				end
			end
			pick
			@board.update
			@player == 1 ? @player = 2 : @player = 1
		end
	end

	def end_game
		return true if win || cats
	end

	def win
		@board.winning_rows.any? { |row| solution(row) }
	end

	def solution(row)
		if row.all? { |element| element == 'x' }
			@winner = 1
			return true
		elsif row.all? { |element| element == 'o' }
			@winner = 2
			return true
		else
			return false
		end
	end

	def cats
		if @board.squares.none? { |square| square == '-' }
			@tie = true
			return true
		else
			return false
		end
	end

	def pick
		repeat = true
		while repeat
			repeat = input_validator(prompt)
		end
	end

	def input_validator(input)
		if input =~ /^[a-c][1-3]$/
			unless already_picked(input)
				return false
			else
				puts "Sorry, that square is full. Try again."
				return true
			end
		else
			puts "Sorry, that input was invalid. Try again."
			return true
		end
	end

	def already_picked(input)
		id = ["a1", "b1", "c1", "a2", "b2", "c2", "a3", "b3", "c3"].index(input)
			if @board.squares[id] == '-'
				@board.squares[id] = player_symbol
				return false
			else
				return true
			end
	end

	def player_symbol
		return @player == 1 ? 'x' : 'o'
	end

	def prompt
		puts "Player #{@player}: What square would you like? (e.g. a1)"
		return gets.chomp
	end

end