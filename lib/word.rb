class Word
  attr_accessor :name, :pronunciation, :id

  @@words = {}
  @@total_rows = 0

  def initialize(name, pronunciation, id)
    @name = name
    @pronunciation = pronunciation
    @id = id || @@total_rows += 1
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def update(name, pronunciation)
    @name = name
    @pronunciation = pronunciation
  end

  def save
    @@words[self.id] = Word.new(self.name, self.pronunciation, self.id)
  end

  def self.all
    @@words.values()
  end

  def self.find(id)
    @@words[id]
  end

  def delete
    @@words.delete(self.id)
  end

  def self.clear
    @@total_rows = 0
    @@words = {}
  end

  def definitions
    Definition.find_by_word(self.id)
  end

end
