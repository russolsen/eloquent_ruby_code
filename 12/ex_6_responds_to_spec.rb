
require 'document_identifier'

class DocumentIdentifier

  # ...

  def ==(other)
    return false unless other.respond_to?(:folder)
    return false unless other.respond_to?(:name)
    folder == other.folder && name == other.name
  end
end



class DocumentPointer 
  attr_reader :folder, :name

  def initialize( folder, name )
    @folder = folder
    @name = name
  end 
end 

describe DocumentIdentifier do

  it 'should be equal to a doc pointer' do
    identifier = DocumentIdentifier.new( 'secret/map', 'area51.gif' )
    pointer = DocumentPointer .new('secret/map', 'area51.gif' )

    (identifier == pointer).should == true
    (pointer == identifier).should == false
  end
end

