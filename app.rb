require('sinatra')
require('sinatra/reloader')
require('./lib/definer')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @songs = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do

end

get ('/words/:id') do

end

post('/words') do

end

get('/words/:id/edit') do

end

patch('/words/:id') do

end

delete('/albums/:id') do

end
