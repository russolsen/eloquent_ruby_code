require 'document_identifier'
require '../utils/rspec_utils'

class DocumentIdentifier                                ##(doc_id

  # ...

  def ==(other)
    return true if other.equal?(self)
    return false unless other.instance_of?(self.class)
    folder == other.folder && name == other.name
  end
end                                                    ##doc_id)



describe DocumentIdentifier do

  it "should have the a good ==" do
    first_id = DocumentIdentifier.new( 'secret/plans', 'raygun.txt' )
    second_id = DocumentIdentifier.new('secret/plans', 'raygun.txt' )

    (first_id == first_id).should == true
    (first_id == second_id).should == true
    (first_id == 444).should == false

    output_of {
      puts "They are equal!" if first_id == second_id  ##+demo
    }.should == "They are equal!\n"
  end

end
