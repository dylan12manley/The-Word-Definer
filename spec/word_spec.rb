require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do
    Word.clear
  end
  # describe('#==') do
  #   it("is the same word if it has the same attributes as another word") do
  #       word = Word.new("Blue", nil, 1)
  #       word2 = Word.new("Blue", nil, 1)
  #       expect(word).to(eq(word2))
  # end
  # end
  describe('#save') do
    it('saves an word') do
      word = Word.new("Giant Steps", nil, nil)
      word.save()
      word2 = Word.new("Blue", nil, nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
    expect(Album.all).to(eq([]))
  end
  end


end
