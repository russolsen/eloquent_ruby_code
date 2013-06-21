require 'document_identifier'

class DocumentPointer                    ##(pointer
  attr_reader :folder, :name

  def initialize( folder, name )
    @folder = folder
    @name = name
  end 

  def ==(other)
    return false unless other.respond_to?(:folder)
    return false unless other.respond_to?(:name)
    folder == other.folder && name == other.name
  end
end                                     ##pointer)

describe DocumentPointer do
  it 'should work with other pointers' do
    p1 = DocumentPointer .new('secret/map', 'area51.gif' )
    p2 = DocumentPointer .new('secret/map', 'area51.gif' )
    p3 = DocumentPointer .new('xxx', 'area51.gif' )

    (p1 == p2).should == true
    (p2 == p1).should == true
    (p1 == p3).should == false
    (p3 == p2).should == false
  end

  it 'should work with document identifiers' do
    identifier = DocumentIdentifier.new( 'secret/map', 'area51.gif' )
    pointer = DocumentPointer .new('secret/map', 'area51.gif' )

    (pointer == identifier).should == true
    (identifier == pointer).should == false
    pointer = DocumentPointer.new('secret/map', 'xxxxx' )
    (pointer == identifier).should == false
  end

  it "should not work with other objects without the right methods" do
    pointer = DocumentPointer .new('secret/map', 'area51.gif' )
    (pointer == 'foo').should == false
    (pointer == nil).should == false
  end

  it "should work with some other object with the proper methods" do
    first_id = DocumentPointer.new( 'secret/plans', 'raygun.txt' )
    other = mock
    other.should_receive(:folder).and_return('secret/plans')
    other.should_receive(:name).and_return('raygun.txt')
    (first_id == other).should == true
  end
end
