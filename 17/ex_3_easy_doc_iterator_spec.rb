
require '../code/doc3'
require '../utils/rspec_utils'
require 'doc_each_word'

describe Document do
  it 'should have a good each_word method' do
    d = Document.new( 'Truth', 'Gump', 'Life is like a box of chocolates' )
    out = output_of {
      d.each_word {|word| puts word}
    }
    out.should match( /Life\nis\nlike\n.*choc.*/m)
  end
end
