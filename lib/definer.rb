class Word
  # attr_reader
  @@word = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @definition = attributes.fetch(:definition)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def update(attributes)
    @definition = attributes.fetch(:definition)
  end

  def save
    @@words[self.id] = Word.new(attributes)
    @name = name
    @definition = definition
  end

  def delete
    @@words.delete(self.id)
  end

  def self.clear
    @@total_rows = 0
    @@words = {}
  end

  def self.all
    @@words.values()
  end

end
