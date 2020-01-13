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

describe('clears all word paths', {:type => :feature}) do
  it('creates a word and deleats that word') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'tim')
    click_on('Go!')
    click_on('Clear All Words')
    expect(page).to have_content('There are currently no words to display.')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word with a definition and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'cat')
    click_on('Go!')
    click_on('cat')
    fill_in('Add a definition:', :with => 'issa cat')
    click_on('Add definition')
    expect(page).to have_content('issa cat')
  end
end
