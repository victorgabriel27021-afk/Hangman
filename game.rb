require_relative "word_loader"
require_relative "display"

class Game
	def initialize
		@secret_word = WordLoader.load_word
		@correct_letters = [ ]
		@wrong_letters = [ ]
		@attempts_left = 6
end

def play
	loop do
		Display.show(@secret_word, @correct_letters, @wrong_letters, @attempts_left)

		puts "type a letter"
		input = gets.chomp.downcase

		process_input(input)

		break if game_over?
	end
end

def process_input(letter)
	if @secret_word.include?(letter)
		@correct_letters << letter unless @correct_letters.include?(letter)
	else
		@wrong_letters << letter unless @wrong_letters.include?(letter)
		@attempts_left -= 1
	end
end

def game_over?
	if win?
		puts "You won!"
		true
	elsif @attempts_left <= 0
		puts "You lost! word was #{@secret_word}"
		true
	else
		false
	end
end

def win?
  @secret_word.chars.all? { |l| @correct_letters.include?(l) }
end
end

Game.new.play