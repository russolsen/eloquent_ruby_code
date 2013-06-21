require '../code/doc3'

class Document                     ##(doc

  # ...

  def clone
    Document.new( title.clone, author.clone, content.clone )
  end
end                                ##doc)

describe Document do                   ##(bad
  it 'should have a functional clone method' do
    doc1 = Document.new( 'title', 'author', 'some stuff' )
    doc2 = doc1.clone

    doc1.title.should == 'title'
    doc1.author.should == 'author'
    doc1.content.should == 'some stuff'
  end
end                                  ##bad)


describe Document do
  it 'should have a functional clone method' do
    doc1 = Document.new( 'title', 'author', 'some stuff' )
    doc2 = doc1.clone

    doc2.title.should == 'title'
    doc2.author.should == 'author'
    doc2.content.should == 'some stuff'

    doc2.title.equal?(doc1.title).should_not == true
    doc2.author.equal?(doc1.author).should_not == true
    doc2.content.equal?(doc1.content).should_not == true
  end
end

