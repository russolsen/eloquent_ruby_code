require '../code/doc3'
require '../utils/rspec_utils'

class Document
  def +(other)                             ##(doc_plus_other
    if other.kind_of?(String)
      return Document.new( title, author, "#{content} #{other}")
    end
    Document.new( title, author, "#{content} #{other.content}" )
  end                                         ##doc_plus_other)
end

describe Document do
  it 'should know how to add a string to a doc' do
    doc = Document.new( 'hi', 'russ', 'hello')      ##(doc_plus_string
    new_doc = doc + 'out there!'                    ##doc_plus_string)
    new_doc.content.should == 'hello out there!'
  end

  it 'should blow up if you try to add a doc to a string' do
    doc = Document.new( 'hi', 'russ', 'hello')
    begin
      'I say to you, ' + doc              ##+string_plus_doc
      fail
    rescue TypeError
      File.write( 'type_error.txt', $!.inspect )
    end
  end

  it 'should know how to add a doc to a doc' do
    doc1 =  Document.new( 'hi', 'russ', '11')
    doc2 =  Document.new( 'hi', 'russ', '22')
    doc3 = doc1 + doc2
    doc3.title.should == doc1.title
    doc3.author.should == doc1.author
    doc3.content.should == '11 22' 
  end
end
