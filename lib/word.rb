class Word
  attr_accessor :id, :name, :pronunciation

  @@words = {}
  @@total_rows = 0

  def initialize(id, name, pronunciation)
    @id = id || @@total_rows += 1
    @name = name
    @pronunciation = pronunciation
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

  def delete
    @@words.delete(self.id)
  end

  def self.clear
    @@total_rows = 0
    @@words = {}
  end


end
