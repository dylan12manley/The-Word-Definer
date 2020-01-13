require 'rspec'
require 'word'
require 'definition'

describe '#Word' do

  before(:each) do
    Word.clear
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
        word = Word.new("Blue", nil, 1)
        word2 = Word.new("Blue", nil, 1)
        expect(word).to(eq(word2))
  end
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a word') do
      word = Word.new("Giant Steps", nil, nil)
      word.save()
      word2 = Word.new("Blue", nil, nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end


  describe('#delete') do
      it("deletes an word by id") do
        word = Word.new("Giant Steps", nil, nil)
        word.save()
        word2 = Word.new("Blue", nil, nil)
        word2.save()
        word.delete()
        expect(Word.all).to(eq([word2]))
      end
    end

    describe('.clear') do
    it("clears all words") do
      word = Word.new("Giant Steps", nil, nil)
      word.save()
      word2 = Word.new("Blue", nil, nil,)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#update') do
    it("updates an word by id") do
      word = Word.new("Giant Steps",nil, nil)
      word.save()
      word.update("A Love Supreme", nil)
      expect(word.name).to(eq("A Love Supreme"))
    end
  end

  describe('#add_properties') do
    it("Add the pronunciation of the word") do
      word = Word.new("Dark", "Dhaaar-ckh", nil)
      word.save()
      expect(word.pronunciation).to(eq("Dhaaar-ckh"))
    end
  end

  describe('#definitions') do                 #returns songs from an album
    it("returns an word's definitions") do
      word = Definition.new("Giant", nil, nil)
      word.save()
      definition = Definition.new("Bigger than normal", word.id, nil)
      definition.save()
      definition2 = Definition.new("A big person", word.id, nil)
      definition2.save()
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end

end
