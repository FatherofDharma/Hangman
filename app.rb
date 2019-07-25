require('sinatra')
require('sinatra/reloader')
require('pry')
require './lib/hangman'
also_reload('lib/**/*.rb')
also_reload('app.rb')


get ('/') do
  game = Hangman.new('turtle')
  @word = game.word
  @guesses_left = game.guesses_left
  @guessed_letters = game.guessed_letters
  @game_continue = true
  @spots_to_fill = game.spots_to_fill
  erb(:play_game)
end

post ('/make-guess') do
  letter = params[:letter_choice]
  game = Hangman.current
  @what = false
  @word = game.word
  @spots_to_fill = game.check_word(letter)
  @guesses_left = game.guesses_left
  @guessed_letters = game.guessed_letters
  erb(:play_game)
end

get ('/next_turn') do

end
