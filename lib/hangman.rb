require('pry')


class Hangman
  @@current_hangman = nil

  attr_reader :spots_to_fill, :word

  def initialize(word)
    @word = word
    @guessesLeft = 6
    @spots_to_fill = [0] * word.length
    @@current_hangman = self
  end

  def self.current
    @@current_hangman
  end

  def make_guess
    @guessesLeft -= 1
    guessesLeft
  end

  def checkWord(letter_choice)
    @word.split("").each_with_index do |letter, idx|
      if(letter_choice == letter)
        @spots_to_fill[idx] = 1
      end
    end
    @spots_to_fill
  end


end
