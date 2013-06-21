require '../code/doc3'
require '../utils/rspec_utils'

describe "Various avg word size impls" do

  it "should return the right avg size with loop impl" do
    doc = Document.new( 'title', 'author', 'The Roots Of All Evil')
    lower_case_words = doc.words.map { |word| word.downcase }        ##+downcase
    lower_case_words.should == %w{ the roots of all evil}

    out = output_of {
      pp doc.words.map { |word| word.size }                   ##+sizes
      lengths =  doc.words.map { |word| word.size }
      lengths.should == [ 3, 5, 2, 3, 4 ]
    }
    File.write( 'sizes.txt', out )
  end

end
