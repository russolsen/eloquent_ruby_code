require '../code/doc3'
require '../utils/rspec_utils'

class Document
  def each_word
    word_array = words
    index = 0
    while index < words.size
      yield( word_array[index] )
      index += 1
    end
  end
end      

describe 'iterators and exceptions' do
  it 'should stop the iterator' do
    doc = Document.new('example', 'russ', "a b c now d") 

    lambda {
      doc.each_word do |word|                 ##(boom
        raise 'boom' if word == 'now'
      end                                     ##boom)
    }.should raise_error

  end
end
