require 'pp'
require "#{File.dirname(__FILE__)}/ex_lazy_document"

describe BaseDocument do
  it "should throw all sorts of exceptions" do
    doc = BaseDocument.new
    proc { doc.content = "foo" }.should raise_error
    proc { doc.content }.should raise_error
    proc { doc.title = "foo" }.should raise_error
    proc { doc.title }.should raise_error
    proc { doc.author = "foo" }.should raise_error
    proc { doc.author }.should raise_error
    proc { doc.content = "foo" }.should raise_error
    proc { doc.content }.should raise_error
    proc { doc.words }.should raise_error
  end
end

shared_examples_for "all documents" do
  it "should hold onto author" do
    @doc.author.should == 'a'
    @doc.author = 'russ'
    @doc.author.should == 'russ'
  end
  it "should hold onto title" do
    @doc = Document.new( "t", "a", "content")
    @doc.title.should == 't'
    @doc.title = 'the ants'
    @doc.title.should == 'the ants'
  end
  it "should hold onto content" do
    @doc = Document.new( "t", "a", "content")
    @doc.content.should == 'content'
    @doc.content = 'the ants'
    @doc.content.should == 'the ants'
  end
end

describe Document do
  it_should_behave_like "all documents"

  before :each do
    @doc = Document.new( 't', 'a', 'content' )
  end
end

describe LazyDocument do
  it_should_behave_like "all documents"

  before :each do
    @doc = LazyDocument.new( "#{File.dirname(__FILE__)}/example.txt" )
  end

end
