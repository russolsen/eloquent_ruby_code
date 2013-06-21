describe TextCompressor do
  it "should compress one word properly" do
    c = TextCompressor.new("hello")
    c.unique.should == [ 'hello' ]
    c.index.should == [ 0 ]
  end

  it "should compress an empty string properly" do
    c = TextCompressor.new("")
    c.unique.should == []
    c.index.should == []
  end

  it "should compress two repeated words properly" do
    c = TextCompressor.new("hello hello")
    c.unique.should == ['hello']
    c.index.should == [0, 0]
  end

  it "should compress a bunch of unique words properly" do
    c = TextCompressor.new("The rain in Spain")
    c.unique.should == %w{ The rain in Spain }
    c.index.should == [0, 1, 2, 3]
  end

  it "should compress a redundant string properly" do
    c = TextCompressor.new("I think I can I think I can")
    c.unique.should == %w{ I think can }
    c.index.should == [0, 1, 0, 2, 0, 1, 0, 2]
  end

  it "should compress the example string properly" do
    c = TextCompressor.new("This specification is the specification for a specification")
    c.unique.should == %w{ This specification is the for a}
    c.index.should == [0, 1, 2, 3, 1, 4, 5, 1]
  end
end
