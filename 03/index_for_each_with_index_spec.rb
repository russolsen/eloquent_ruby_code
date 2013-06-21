require '../code/doc3'

class Document 
  def index_for( word )              ##(main
    words.each_with_index do |this_word, i|
      return i if this_word == word
    end 
    nil 
  end                                ##main)
end 

describe "index_for method" do
  before :each do
    @doc = Document.new( 'title', 'author', 'the rain in spain')
  end

  it "should return the right word indexes" do
    @doc.index_for( 'the' ).should == 0
    @doc.index_for( 'rain' ).should == 1
    @doc.index_for( 'spain' ).should == 3
  end
end
