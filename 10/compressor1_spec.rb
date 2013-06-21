require 'compressor1'
require 'compressor_examples'


describe "Examples int he book" do
  it 'should match the example' do
    text = "This specification is the spec for a specification"  ##(make
    compressor = TextCompressor.new( text )                               ##make)

    unique_word_array = compressor.unique                                 ##(use
    word_index = compressor.index                                         ##use)

    unique_word_array.class.should == Array
    word_index.class.should == Array
    unique_word_array[word_index[0]].should == 'This'
  end
end
