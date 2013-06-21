require '../code/doc4'

class Document
  attr_accessor :page_layout, :page_size, :revision_date
end

require 'ssdoc_mm'

describe "mm delegation examples" do
  it "should have a working MM secret document" do
    doc = Document.new( 'The Plans', 'Russ', 'We attack at dawn' )
    doc.page_layout = :landscape
    doc.page_size = :A4
    doc.revision_date = :yesterday

    sdoc =  SuperSecretDocument.new( doc, 1 )
    sdoc.content.should == 'We attack at dawn'
    sdoc.words.should == %w{We attack at dawn}
    sdoc.page_layout.should == :landscape
    sdoc.page_size.should == :A4
    sdoc.revision_date.should == :yesterday
  end


  it "should timeout" do
    doc = Document.new( 'The Plans', 'Russ', 'We attack at dawn' )

    sdoc =  SuperSecretDocument.new( doc, 1 )
    sleep 1.2
    lambda { sdoc.content }.should raise_error
  end


  it "should also work with a string" do
    lambda {
    string = 'Good morning, Mr. Phelps'                 ##(with_string
    secret_string = SuperSecretDocument.new( string, 5 )
    puts secret_string.length           # Works fine 
    sleep 6
    puts secret_string.length           # Raises an exception  ##with_string)
    }.should raise_error(RuntimeError)
  end
end
