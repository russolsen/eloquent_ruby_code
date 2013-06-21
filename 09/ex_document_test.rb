require 'pp'
require 'test/unit'                           ##(main
require 'document.rb' 

class DocumentTest < Test::Unit::TestCase 
  def test_document_holds_onto_contents      ##(one_method
    text = 'A bunch of words' 
    doc = Document.new('test', 'nobody', text) 
    assert_equal text, doc.content, 'Contents are still there'  ##+with_comment
  end                                             ##one_method)

  def test_that_doc_can_return_words_in_array 
    text = 'A bunch of words' 
    doc = Document.new('test', 'nobody', text) 
    assert doc.words.include?( 'A' )
    assert doc.words.include?( 'bunch' )                 ##+plain_assert
    assert doc.words.include?( 'of' )
    assert doc.words.include?( 'words' )
  end 

  def test_that_word_count_is_correct 
    text = 'A bunch of words' 
    doc = Document.new('test', 'nobody', text) 
    assert_equal 4, doc.word_count, 'Word count is correct' 
  end 
end                                         ##main)
