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
  # elsif params["clear_definitions"]
  #   @definitions = Definition.clear()
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
  if params[:clear_definitions]
    @definitions = Definition.clear()
    # erb(:/words/:id)
  else
  @word = Word.find(params[:id].to_i())
end
erb(:edit_word)
end

patch('/words/:id') do
  @word  = Word.find(params[:id].to_i())
  @word.update(params[:name], params[:pronounce])
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

get('/words/:id/definitions/:word_id') do
  @definition = Definition.find(params[:word_id].to_i())
  erb(:definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_name], @word.id, nil)
  definition.save()
  erb(:word)
end


patch('/words/:id/definitions/:word_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:word_id].to_i())
  definition.update(params[:definition_name])
  erb(:word)
end

delete('/words/:id/definitions/:word_id') do
  definition = Definition.find(params[:word_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
