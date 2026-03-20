class WordLoader
	def self.load_words
    File.readlines("google-10000-english-no-swears.txt", chomp: true)
end

	def self.valid_words(words)
		words.select do |word|
			word.length >= 5 && word.length <= 12
		end
	end

	def self.load_word
		words = load_words
		valid = valid_words(words)
		valid.sample
	end
end