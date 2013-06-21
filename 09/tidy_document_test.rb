require 'document.rb' 
require 'test/unit'

class DocumentTest < Test::Unit::TestCase       ##(main
  def setup 
    @text = 'A bunch of words' 
    @doc = Document.new('test', 'nobody', @text) 
  end 

  def test_that_document_holds_onto_contents 
    assert_equal @text, @doc.content, 'Contents are still there' 
  end 

  def test_that_doc_can_return_words_in_array
    assert @doc.words.include?( 'A' )
    assert @doc.words.include?( 'bunch' )
    assert @doc.words.include?( 'of' )
    assert @doc.words.include?( 'words' )
  end

  def test_that_word_count_is_correct 
    assert_equal 4, @doc.word_count, 'Word count is correct' 
  end 
end                                              ##main)
