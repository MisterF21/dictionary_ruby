class Term
attr_reader :word, :terms, :definition, :definition_array, :word_array

  @@terms = []

  def initialize(word, definition)
    @word_array = []
    @word_array << Word.new(word)

    @definition_array = []
    @definition_array << Definition.new(definition)

    @@terms << self
  end

  def Term.all_terms
    @@terms
  end

  def Term.clear
    @@terms = []
  end

  def edit_word(new_word)
    @word = new_word
  end

  def add_words(added_word)
    @word_array << Word.new(added_word)
  end

  def edit_definition(new_definition)
    @definition = Definition.new(definition)
  end

  def add_definition(definition)
    @definition_array <<  Definition.new(definition)
  end

  def Term.delete_term(word)
    @@terms.delete_if{|term| term == word}
  end

  def delete_word
    @word = nil
  end

  def delete_definition
    @definition = nil
  end

  def search(search_term)
    Term.all_terms.select {|term| term == search_term }
  end
end
