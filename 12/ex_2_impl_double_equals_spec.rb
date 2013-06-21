
require 'document_identifier'

class DocumentIdentifier                        ##(doc_id
  attr_reader :folder, :name

  def initialize( folder, name )
    @folder = folder
    @name = name
  end

  def ==(other)
    return false unless other.instance_of?(self.class)
    folder == other.folder && name == other.name
  end
end                                            ##doc_id)

class SubId < DocumentIdentifier
end

describe DocumentIdentifier do

  it "should have the a good ==" do
    first_id = DocumentIdentifier.new( 'secret/plans', 'raygun.txt' )
    second_id = DocumentIdentifier.new('secret/plans', 'raygun.txt' )

    puts "They are equal!" if first_id == second_id

    (first_id == first_id).should == true
    (first_id == second_id).should == true
    (first_id == 444).should == false
  end

  it 'should say no to subclasses' do
    i = DocumentIdentifier.new( 'secret/plans', 'raygun.txt' )
    si = SubId.new( 'secret/plans', 'raygun.txt' )
    (si == si).should == true
    (si == i).should == false
  end

end
