require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('start a new game and guess t', {:type => :feature}) do
  it('starts a new game and guesses the letter t') do
    visit('/')
    fill_in('letter_choice', :with => 't')
    click_on('Guess!')
    save_and_open_page
    expect(page).to have_content('t ___ ___ t ___ ___')
  end
end
