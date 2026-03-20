require "json"

class SaveLoad
	def self.save_game(game)
		data = {
			secret_word: game.instance_variable_get(:@secret_word),
			correct_letters: game.instance_variable_get(:@correct_letters),
			wrong_letters: game.instance_variable_get(:@wrong_letters),
			attempts_left: game.instance_variable_get(:@attempts_left)
		}
	File.write("save.json", JSON.dump(data))
end

def self.load_game
	data = JSON.parse(File.read("save.json"))

	game = Game.new

	game.instance_variable_set(:@secret_word, data["secret_word"])
	game.instance_variable_set(:@correct_letters, data["correct_letters"])
	game.instance_variable_set(:@wrong_letters, data["wrong_letters"])
	game.instance_variable_set(:@attempts_left, data["attempts_left"])

	game 
end
end