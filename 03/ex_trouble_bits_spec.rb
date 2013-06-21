require '../utils/rspec_utils'

describe "how to stay out of trouble" do

  it "should avoid deleting things in mid iteration" do

    array = []

    out = output_of {
      array = [ 0, -10, -9, 5, 9 ]     ##(delete_at
      array.each_index {|i| array.delete_at(i) if array[i] < 0}
      pp array                         ##delete_at)
    }
    array.should == [0, -9, 5, 9]

    File.write("delete.txt", out )
  end

  it "should fill in the empty bits of an array" do
    array = []                          ##(empty
    array[24601] = "Jean Valjean"       ##empty)

    array.size.should == 24602
    array[24601].should ==  "Jean Valjean"
    0..24600.times { |i| array[i].should == nil }
  end

  it "should be possible to use a hash as a set" do
    words = %w{ happy just be happy happy happy}

    word_is_there = {}          ##(hash_set
    words.each { |word| word_is_there[ word ] = true }  ##hash_set)

    word_is_there.size.should == 3
    word_is_there['just'].should == true
    word_is_there['be'].should == true
    word_is_there['happy'].should == true
  end

  it "should be possible to use an array as a set" do
    words = %w{ happy just be happy happy happy}

    unique = []                         ##(array_set
    words.each { |word| unique << word unless unique.include?(word) } ##array_set)

    unique.size.should == 3
    unique.include?('just').should == true
    unique.include?('be').should == true
    unique.include?('happy').should == true
  end

  it "should be possible to use a set as a set" do
    words = %w{ happy just be happy happy happy}

    require 'set'                ##(set_set

    word_set = Set.new( words )    ##set_set)

    word_set.size.should == 3
    word_set.include?('just').should == true
    word_set.include?('be').should == true
    word_set.include?('happy').should == true
  end
end
