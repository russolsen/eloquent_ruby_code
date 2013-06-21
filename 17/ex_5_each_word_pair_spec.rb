require '../code/doc3'
require '../utils/rspec_utils'


class Document                      ##(pair
  # Most of the class omitted...

  def each_word_pair
    word_array = words
    index = 0
    while index < (word_array.size-1)
      yield word_array[index], word_array[index+1]
      index += 1
     end
  end
end                                 ##pair)

describe Document do
  it 'should have a good each_word_pair method' do
    out = output_of {
      doc = Document.new('Donuts', '?', 'I love donuts mmmm donuts' )   ##(donuts
      doc.each_word_pair{ |first, second| puts "#{first} #{second}" }   ##donuts)
    }
    out.should match( /I love\nlove donuts\ndonuts mmmm\nmmmm donuts\n/m )
    File.write( 'donuts.txt', out )
  end
end


describe "The times method" do
  it 'should work as advertised' do
    12.times { |x| puts "The number is #{x}" }   ##+times
  end
end
