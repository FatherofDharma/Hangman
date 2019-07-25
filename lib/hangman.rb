require('pry')


class Hangman
  @@current_hangman = nil

  attr_reader :spots_to_fill, :word, :guesses_left, :guessed_letters

  def initialize(word)
    @word = word
    @guesses_left = 6
    @spots_to_fill = [0] * word.length
    @guessed_letters = []
    @@current_hangman = self
  end

  def self.current
    @@current_hangman
  end

  def check_word(letter_choice)
    if letter_choice == ""
      return @spots_to_fill
    end
    found_match = false
    @word.split("").each_with_index do |letter, idx|
      if(letter_choice == letter)
        @spots_to_fill[idx] = 1
        found_match = true
      end
    end
    if !found_match && !@guessed_letters.include?(letter_choice) 
      @guesses_left -= 1
      @guessed_letters.push(letter_choice)
    end
    @spots_to_fill
  end


end
