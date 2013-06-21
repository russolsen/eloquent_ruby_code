require '../code/document.rb'
require '../utils/rspec_utils'

describe 'chapter' do
  it 'should have a good everything is an object examples' do
    (
       -3.abs           # Returns 3      ##+abs_example
    ).should == 3

    # Call some methods on some objects  ##(various_examples

    "abc".upcase
    :abc.length
    /abc/.class              ##various_examples)


    # Call some methods on a couple of familiar objects ##(truefalse_examples

    true.class         # Returns Trueclass
    false.nil?         # False is close, but not nil    ##truefalse_examples)

    (
      true.class.class # Returns Class    ##+true_class_example
    ).should == Class

    nil.class            # Returns NilClass  ##(nil_class_example
    nil.nil?             # Yes, finally true!  ##nil_class_example)
  end
end
