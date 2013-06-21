require '../code/doc3'

describe "Various avg word size impls" do
  before :each do
    @one_word = Document.new( 'title', 'author', 'oneword')
    @two_word = Document.new( 'title', 'author', 'to be')
    @three_word = Document.new( 'title', 'author', 'a bb ccc')
    @lots = Document.new( 'title', 'author', 'The roots of all evil')
  end

  it "should return the right avg size with loop impl" do
    load "ex_for_word_len.rb"
    @one_word.average_word_length.should == 7
    @two_word.average_word_length.should == 2
    @three_word.average_word_length.should == 2
    @lots.average_word_length.should == 3.4
  end

  it "should return the right avg size with each index impl" do
    load "ex_each_index_word_len.rb"
    @one_word.average_word_length.should == 7
    @two_word.average_word_length.should == 2
    @three_word.average_word_length.should == 2
    @lots.average_word_length.should == 3.4
  end

  it "should return the right avg size with each impl" do
    load "ex_each_word_len.rb"
    @one_word.average_word_length.should == 7
    @two_word.average_word_length.should == 2
    @three_word.average_word_length.should == 2
    @lots.average_word_length.should == 3.4
  end

  it "should return the right avg size with inject impl" do
    load "ex_inject_word_len.rb"
    @one_word.average_word_length.should == 7
    @two_word.average_word_length.should == 2
    @three_word.average_word_length.should == 2
    @lots.average_word_length.should == 3.4
  end

end
