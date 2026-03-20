class Display
  def self.show(secret_word, correct_letters, wrong_letters, attempts_left)
    display_word = secret_word.chars.map do |letter|
      if correct_letters.include?(letter)
        letter
      else
        "_"
      end
    end

    puts display_word.join(" ")
    puts "wrong letters: #{wrong_letters.join(", ")}"
    puts "attempts_left: #{attempts_left}"
  end
end