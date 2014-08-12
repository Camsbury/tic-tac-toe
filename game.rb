# Wrapper Game class for Tic Tac Toe
class Game

	# sets the default conditions for player and tie and creates a new board
	def initialize
		@player = 1
		@tie = false
		@board = Board.new
	end

	# the game loop that actually has a set number of turns for safety
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

	# checks if the game is over
	def end_game
		return true if win || cats
	end

	# checks if there is a winner
	def win
		@board.winning_rows.any? { |row| solution(row) }
	end

	# checks if a row has all one symbol
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

	# checks for a tie
	def cats
		if @board.squares.none? { |square| square == '-' }
			@tie = true
			return true
		else
			return false
		end
	end

	# allows the user to make a choice
	def pick
		repeat = true
		while repeat
			repeat = input_validator(prompt)
		end
	end

	# verifies that input is valid before taking
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

	# verifies that the input hasn't already been chosen before feeding to board
	def already_picked(input)
		id = ["a1", "b1", "c1", "a2", "b2", "c2", "a3", "b3", "c3"].index(input)
			if @board.squares[id] == '-'
				@board.squares[id] = player_symbol
				return false
			else
				return true
			end
	end

	# gives the player a symbol depending on which player they are
	def player_symbol
		return @player == 1 ? 'x' : 'o'
	end

	# asks the player to make a move and takes it
	def prompt
		puts "Player #{@player}: What square would you like? (e.g. a1)"
		return gets.chomp
	end

end