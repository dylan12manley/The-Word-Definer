require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create a word path', {:type => :feature}) do
it('creates a word and goes to that word page') do
  visit('/words')
  click_on('Add a new word')
  fill_in('word_name', :with => 'tim')
  click_on('Go!')
  expect(page).to have_content('tim')
end
end
