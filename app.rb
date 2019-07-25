require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('./lib/song')
require('pry')
require 'hangman'
also_reload('lib/**/*.rb')
also_reload('app.rb')


get ('/') do
  @game = Hangman.new('turtle')
  erb(:play_game)
end

post ('/make-guess') do
  letter = params(:letter_choice)
  game = Hangman.current_hangman
  @game_continue = game.make_guess
  @word = game.word
  @spots_to_fill = game.check_word(letter)
  erb(:play_game)
end
