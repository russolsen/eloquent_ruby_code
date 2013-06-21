require 'document'                       ##(main

describe Document do 
  before :each do
    @text = 'A bunch of words' 
    @doc = Document.new( 'test', 'nobody', @text ) 
  end

  it 'should hold on to the contents' do 
    @doc.content.should == @text 
  end 

  it 'should know which words it has' do
    @doc.words.should include( 'A' )
    @doc.words.should include( 'bunch' )
    @doc.words.should include( 'of' )
    @doc.words.should include( 'words' )
  end

  it 'should know how many words it contains' do 
    @doc.word_count.should == 4 
  end 

end                                         ##main)
