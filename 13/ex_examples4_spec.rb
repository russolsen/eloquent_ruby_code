require '../code/doc3'

class Document                                      ##(doc
  def self.create_test_document( length ) 
    Document.new( 'test', 'test', 'test ' * length ) 
  end 

  # ... 
end                                                 ##doc)

describe Document do
  it 'should have a create_test_document method' do
    book = Document.create_test_document( 10000 )   ##+good

    lambda { 
      longer_doc = book.create_test_document( 20000 ) ##+bad
    }.should raise_error(NoMethodError)

    longer_doc = book.class.create_test_document( 20000 ) ##+fixed
  end
end
