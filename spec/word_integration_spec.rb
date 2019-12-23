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

# describe('create a definition path', {:type => :feature}) do
#   it('creates a word with a definition and then goes to the word page') do
#     word = Word.new("Kitty", nil, nil,)
#     word.save
#     visit("/words/#{word.id}")
#     fill_in('definition_name', :with => 'issa cat')
#     click_on('Add definition')
#     expect(page).to have_content('issa cat')
#   end
# end
