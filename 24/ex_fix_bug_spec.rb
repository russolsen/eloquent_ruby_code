require '../code/doc4'

require 'document'   # Pull in original, broken class  ##(main

class Document
  def average_word_length
    return 0.0 if word_count == 0 
    total = words.inject(0.0){ |result, word| word.size + result}
    total / word_count
  end
end                                   ##main)


describe 'monkey patched document class' do

  it 'should return 0.0 for an empty document' do
    d = Document.new( 'empty', 'russ', '' )
    d.average_word_length.should == 0.0
    d.content = 'hello'
    d.average_word_length.should == 5.0
  end
end
