require('sinatra')
require('sinatra/reloader')
require('./lib/word.rb')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/definition.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  if params["clear"]
    @words = Word.clear()
  else
    @words = Word.all
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
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word  = Word.find(params[:id].to_i())
  @word.update(params[:name], params[:pronounce])
  @words = Word.all
  erb(:words)
end

delete('/albums/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end
