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


describe DocumentIdentifier do
  it 'should fail as a hash key' do
    hash = {}                                                ##(simple
    document = Document.new( 'cia', 'Roswell', 'story' )
    first_id =  DocumentIdentifier.new( 'public', 'CoverStory' )

    hash[first_id] = document                                ##simple)


    hash[first_id].equal?(document).should == true

    second_id =  DocumentIdentifier.new( 'docs/public', 'CoverStory' ) ##(id2
    the_doc_again =  hash[second_id]                                   ##id2)

    the_doc_again.should == nil
  end
end

