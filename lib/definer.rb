class Word
  # attr_reader
  @@word = {}
  @@total_rows = 0

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def update(attributes)
    @definition = attributes.fetch(:definition)
  end

  def save(attributes)
    @@word[self.id] = Word.new(self.definition, self.id)
  end


end
