
require 'document_identifier'

describe DocumentIdentifier do

  it "should repect equal?" do
    i1 = DocumentIdentifier.new( 'books', 'warandpeace' )
    i2 = i1
    i3 = DocumentIdentifier.new( 'books', 'warandpeace' )
    i1.equal?(i1).should == true
    i1.equal?(i2).should == true
    i1.equal?(i3).should == false
  end

  it "should have the default ==" do
    first_id = DocumentIdentifier.new( 'secret/plans', 'raygun.txt' ) ##(intro
    second_id = DocumentIdentifier.new('secret/plans', 'raygun.txt' )

    puts "They are equal!" if first_id == second_id                        ##intro)

    (first_id == second_id).should == false
  end

end
