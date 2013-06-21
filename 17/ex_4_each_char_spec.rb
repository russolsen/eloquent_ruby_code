require '../code/doc3'
require '../utils/rspec_utils'


class Document                       ##(main

  # Stuff omitted

  def each
    # iterate over the words as in our first example
  end

  def each_character
    # iterate over the characters
  end
end                                  ##main)


require 'doc_with_each_char'


describe Document do
  it 'should have a good each_character method' do
    d = Document.new( 'Truth', 'Gump', 'Life is like a box of chocolates' )
    out = output_of {
      d.each_character {|ch| puts ch}
    }
    out.should match( /L\ni\nf\n.*e\ns\n/m)
  end
end
