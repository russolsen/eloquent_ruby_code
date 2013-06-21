
require 'document_identifier'

class DocumentIdentifier

  # ...

  def ==(other)
    return false unless other.respond_to?(:folder)
    return false unless other.respond_to?(:name)
    folder == other.folder && name == other.name
  end
end


class VersionedIdentifier < DocumentIdentifier  ##(vi
  attr_reader :version

  def initialize( folder, name, version )
    super( folder, name )
    @version = version
  end

   def ==(other)
    if other.instance_of? VersionedIdentifier
      other.folder == folder &&
      other.name == name &&
      other.version == version
    elsif other.instance_of? DocumentIdentifier
      other.folder == folder && other.name == name
    else
      false
    end
  end
end                                              ##vi)

class VersionedIdentifier
  def as_document_identifier                   ##(as_doc_id
    DocumentIdentifier.new( folder, name )
  end                                          ##as_doc_id)

  def is_same_document?(other)                 ##(same_doc
    other.folder == folder && other.name == name
  end                                          ##same_doc)
end

describe VersionedIdentifier do

  it 'should break trans' do
    versioned1 = VersionedIdentifier.new( 'specs', 'bfg9k', "V1" ) ##(make
    versioned2 = VersionedIdentifier.new( 'specs', 'bfg9k', "V2" )
    unversioned = DocumentIdentifier .new('specs', 'bfg9k')       ##make)

    (
      versioned1 == unversioned # True!   ##(trans_good
    ).should == true                      ##--trans_good
                                          ##--trans_good
    (                                     ##--trans_good
      unversioned == versioned2 # True!   ##trans_good)
    ).should == true 

    (
      versioned1 ==  versioned2 # Not true!   ##+trans_bad
    ).should == false
  end

  it 'should support as_document_identifier' do
    v = VersionedIdentifier.new( 'public', 'area51.gif', "V1" )
    u = DocumentIdentifier .new('public', 'area51.gif')
    (u == v.as_document_identifier).should == true
    (v.as_document_identifier == u).should == true
  end

  it 'should support is_same_document?' do
    v = VersionedIdentifier.new( 'public', 'cover.txt', "V1" )
    u = DocumentIdentifier .new('public', 'cover.txt')
    v.is_same_document?(u).should == true
  end

end
