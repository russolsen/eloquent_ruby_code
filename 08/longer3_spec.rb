
require '../code/simple_doc'

class Document
  # Given a number, which needs to be an instance of Numeric, ##(longer
  # return true if the number of characters in the document
  # exceeds the number.
  def is_longer_than?( number_of_characters )
    @content.length > number_of_characters
  end                                                         ##longer)
end

describe "is longer than" do
  it 'return true if arg is bigger than size' do
    doc = Document.new( 'a doc', 'russ', 'abc' )
    doc.is_longer_than?( 1 ).should == true
    doc.is_longer_than?( 2 ).should == true
    doc.is_longer_than?( 3 ).should == false
    doc.is_longer_than?( 4 ).should == false
    doc.is_longer_than?( 999 ).should == false
  end

end
