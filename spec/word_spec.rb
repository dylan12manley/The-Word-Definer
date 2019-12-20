require 'rspec'
require 'word'

describe '#Word' do

# describe('#==') do
#   it("is the same word if it has the same attributes as another word") do
#       word = Word.new("Blue", nil, 1)
#       word2 = Word.new("Blue", nil, 1)
#       expect(word).to(eq(word2))
# end
# end
describe('#save') do
    it("saves an word") do
      word = Word.new("Giant Steps", nil, nil) 
      word.save()
      word2 = Word.new("Blue", nil, nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

end
