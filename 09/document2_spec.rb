require '../code/doc3'

describe Document do
  it 'should hold on to the contents' do 
    text = 'A bunch of words' 
    doc = Document.new( 'test', 'nobody', text ) 
    doc.content.should == text 
  end 

  it 'should return all of the words in the document' do
    text = 'A bunch of words' 
    doc = Document.new( 'test', 'nobody', text ) 
    doc.content.should match( /A bunch.*/ )
    doc.words.include?( 'bunch' ).should == true     ##+simple_should
    doc.words.should include( 'bunch' )              ##+should_include
    doc.words.should include( 'of' )
    doc.words.should include( 'words' )
    doc.words.should_not include( 'Excelsior' )
  end

  it 'should know how many words it contains' do 
    text = 'A bunch of words' 
    doc = Document.new( 'test', 'nobody', text ) 
    doc.word_count.should == 4 
  end 

end
