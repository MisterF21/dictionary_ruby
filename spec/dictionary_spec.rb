require 'rspec'
require './lib/dictionary'
require './lib/word'
require './lib/definition'

describe 'Term' do
  before do
    Term.clear
  end

  describe 'initialize' do
    it 'initializes a new object from the Term class with a word and definition and a language' do
      test_term = Term.new("carrot", "a delicious vegetable")
      test_term.should be_an_instance_of Term
    end
  end

  describe '.all_terms' do
    it 'creates an array for one term' do
      test_term = Term.new("carrot", "a delicious vegetable")
      Term.all_terms.should eq [test_term]
    end

    it 'creates an array for all terms' do
      test_term = Term.new("carrot", "a delicious vegetable")
      test_term2 = Term.new("apple", "a delicious fruit")
      test_term3 = Term.new("orange", "an orange fruit")
      Term.all_terms.should eq [test_term, test_term2, test_term3]
    end
  end

  describe '.clear' do
    it 'clears the array of all terms' do
      test_term = Term.new("carrot", "a delicious vegetable")
      Term.clear
      Term.all_terms.should eq []
    end
  end

  describe '.edit_word' do
    it 'edits a word' do
      test_term = Term.new("carot", "a vile vegetable")
      test_term.edit_word("carrot").should eq ("carrot")
    end
  end

  describe '.edit_definition' do
    it 'edits a definition' do
      test_term = Term.new("carot", "a vile vegetable")
      test_term.edit_definition("a delicious vegetable").should be_an_instance_of Definition
    end
  end

  describe '.delete_word' do
    it 'deletes a word' do
      test_term = Term.new("carrot", "a vile vegetable")
      test_term.delete_word.should eq nil
    end
  end

  describe '.delete_definition' do
    it 'deletes a definition' do
      test_term = Term.new("carrot", "a vile vegetable")
      test_term.delete_definition.should eq nil
    end
  end

  describe '.delete_term' do
    it 'deletes an entire entry' do
      test_term = Term.new("carrot", "a vile vegetable")
      test_term2 = Term.new("onion", "a sad vegetable")
      Term.delete_term(test_term)
      Term.all_terms.should eq [test_term2]
    end
  end

  describe '.add_definition' do
    it 'adds a definition' do
      test_term = Term.new("carrot", "a delicious vegetable")
      test_term.add_definition("is orange")
      test_term.word_array[0].should be_an_instance_of Word
      test_term.definition_array[0].should be_an_instance_of Definition
    end
  end

  describe '.add_words' do
    it 'adds a word to a term' do
    test_term = Term.new("carrot", "a delicious vegetable")
    test_term.word_array[0].should be_an_instance_of Word
    test_term.definition_array[0].should be_an_instance_of Definition
    end
  end

  describe '.search' do
    it 'locates a word and returns a word and description' do
    test_incorrect = Term.new("fish", "it swims")
    test_term = Term.new("carrot", "a delicious vegetable")
    test_wrong_term = Term.new("horse", "it gallops")
    test_wrong_term2 = Term.new("bird", "it flies")
    test_term.search(test_term).should eq [test_term]
    end
  end
end
