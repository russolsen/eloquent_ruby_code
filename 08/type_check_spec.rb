
require '../code/simple_doc'

class Document
  def initialize( title, author, content )              ##(bad_type
    raise "title isn't a String" unless title.kind_of? String
    raise "author isn't a String" unless author.kind_of? String
    raise "content isn't a String" unless content.kind_of? String
    @title = title
    @author = author
    @content = content
  end                                                   ##bad_type)
end

describe "bad type checking" do
  it 'should throw and error if the title isnt a string' do
    lambda { doc = Document.new( 1, "", "" )}.should raise_error(RuntimeError)   
  end

  it 'should throw and error if the author isnt a string' do
    lambda { doc = Document.new( "", 1, "" )}.should raise_error(RuntimeError)   
  end

  it 'should throw and error if the content isnt a string' do
    lambda { doc = Document.new( "", "", 1 )}.should raise_error(RuntimeError)   
  end
end
