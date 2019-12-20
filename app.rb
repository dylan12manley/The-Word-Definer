require('sinatra')
require('sinatra/reloader')
require('./lib/definer')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @songs = Word.all
  erb(:words)
end

get('/word') do
  @words = Word.all
  erb(:words)
end
