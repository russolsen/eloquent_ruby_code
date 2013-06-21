require 'ex_lazy_document'
require 'title_author'

describe Title do
  it "should hold onto its attributes" do
    t = Title.new( 'dick and jane', 'd&j', '1234')
    t.long_name.should == 'dick and jane'
    t.short_name.should == 'd&j'
    t.isbn.should == '1234'
  end
end

describe Author do
  it "should hold onto its attributes" do
    a = Author.new( 'russ', 'olsen' )
    a.first_name.should == 'russ'
    a.last_name.should == 'olsen'
  end

  it "should look like example in book" do

    two_cities = Title.new( 'A Tale Of Two Cities',   ##(2cities
                            '2 Cities', '0-999-99999-9' ) 
    dickens = Author.new( 'Charles', 'Dickens' ) 
    doc = Document.new( two_cities, dickens, 'It was the best...' ) ##2cities)

    two_cities.long_name.should == 'A Tale Of Two Cities'
  end
end
