
require '../code/doc3'
require '../utils/rspec_utils'

class Document                       ##(main

  # Stuff omitted...

  def each_word
    word_array = words
    index = 0
    while index < words.size
      yield( word_array[index] )
      index += 1
    end
  end
end                                  ##main)

describe Document do
  it 'should have a good each_word method' do
    out = output_of {
      d = Document.new( 'Truth', 'Gump', 'Life is like a box of ...' )         ##(example
      d.each_word {|word| puts word}                                          ##example)
    }
    out.should match( /Life\nis\nlike\n.*/m)
    File.write( 'choc.txt', out )
  end
end
