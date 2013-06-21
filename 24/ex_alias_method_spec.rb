require '../code/doc4'

class Document                        ##(main
  # Stuff omitted... 
 
  def word_count 
    words.size 
  end 
 
  alias_method :number_of_words,  :word_count 
  alias_method :size_in_words,  :word_count 
   
  # Stuff omitted... 
end                                   ##main)

describe 'aliases' do

  it 'should provide a copy of the method' do
    doc = Document.new( 'example', 'russ', 'one two three' )
    doc.word_count.should == 3
    doc.word_count.should == doc.number_of_words
    doc.word_count.should == doc.size_in_words
  end
end
