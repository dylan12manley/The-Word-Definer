require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/definition')

get('/') do
  @songs = Word.all
  erb(:words)
end

get('/words') do
  if params["clear"]
    @albums = Album.clear()
  else
    @@words = Word.all
  end
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  name = params[:word_name]
  pronunciation = params[:pronunciation_in]
  word = Word.new(name, pronunciation, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do

end

patch('/words/:id') do

end

delete('/albums/:id') do

end
