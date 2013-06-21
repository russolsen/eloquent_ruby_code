require 'pp'
require 'test/unit'
require 'document.rb' 

class DocumentTest < Test::Unit::TestCase 
  def test_document_holds_onto_contents      ##(one_method
    text = 'A bunch of words' 
    doc = Document.new('test', 'nobody', text) 
    assert_equal text, doc.content
  end                                             ##one_method)
end
