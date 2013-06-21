require '../code/doc3'
require 'document_identifier'

class DocumentIdentifier

  # ...

  def ==(other)
    return false unless other.respond_to?(:folder)
    return false unless other.respond_to?(:name)
    folder == other.folder && name == other.name
  end
end

class DocumentIdentifier              ##(doc_id 

  # Code omitted... 

  def hash 
    folder.hash ^ name.hash 
  end 

  def eql?(other) 
    return false unless other.instance_of?(self.class) 
    folder == other.folder && name == other.name 
  end 
end                                   ##doc_id)


describe DocumentIdentifier do
  it 'should return the right doc with the right key' do
    hash = {}
    document = Document.new( 'cia', 'Roswell', 'Nothing happened!' )
    first_id =  DocumentIdentifier.new( 'docs/public', 'CoverStory' )

    hash[first_id] = document
    hash[first_id].equal?(document).should == true

    another_id =  DocumentIdentifier.new( 'docs/public', 'CoverStory' )
    the_doc_again =  hash[another_id] 

    the_doc_again.should == document

    hash[:foo].should == nil
    junk_id =  DocumentIdentifier.new( 'docs/public', 'XXX' )
    hash[junk_id].should == nil
  end
end

