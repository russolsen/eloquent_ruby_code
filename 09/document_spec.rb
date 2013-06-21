require '../code/doc3'

describe Document do                            ##(main
  it 'should hold on to the contents' do 
    text = 'A bunch of words' 
    doc = Document.new( 'test', 'nobody', text ) 
    doc.content.should == text 
  end 

  it 'should return all of the words in the document' do
    text = 'A bunch of words' 
    doc = Document.new( 'test', 'nobody', text ) 
    doc.words.include?( 'A' ).should == true
    doc.words.include?( 'bunch' ).should == true
    doc.words.include?( 'of' ).should == true
    doc.words.include?( 'words' ).should == true
  end

  it 'should know how many words it contains' do 
    text = 'A bunch of words' 
    doc = Document.new( 'test', 'nobody', text ) 
    doc.word_count.should == 4 
  end 
end                                               ##main)
