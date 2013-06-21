require 'document_identifier'
require 'pp'
require '../utils/rspec_utils'

class DocumentIdentifier
  attr_reader :folder, :name

  def initialize( folder, name )
    @folder = folder
    @name = name
  end
end

class DocumentIdentifier                             ##(kind
  # ...

  def ==(other)
    return true if other.equal?(self)
    return false unless other.kind_of?(self.class)
    folder == other.folder && name == other.name
  end
end


class ContractIdentifier < DocumentIdentifier
end                                                  ##kind)

describe DocumentIdentifier do

  it 'should match the repeat example' do
    doc_id =  DocumentIdentifier.new( 'contracts', 'Book Deal' )   ##(repeat
    con_id =  ContractIdentifier.new( 'contracts', 'Book Deal' )

    output_of {            ##--repeat
    puts "They are equal!" if doc_id == con_id                 ##repeat)
    }.should == "They are equal!\n"

    output_of {
      puts "They are equal!" if con_id == doc_id  ##+not_eq
    }.should == ""

  end

  it 'should match the book example' do
    doc_id =  DocumentIdentifier.new( 'contracts', 'Book Deal' )  ##(book_con
    con_id =  ContractIdentifier.new( 'contracts', 'Book Deal' )  ##book_con)

    ( doc_id == con_id ).should == true
  end

  it 'should say yes to subclasses' do
    di = DocumentIdentifier.new( 'secret/plans', 'raygun.txt' )
    ci = ContractIdentifier.new( 'secret/plans', 'raygun.txt' )
    (ci == ci).should == true
    (di == ci).should == true
    (ci == di).should == false
  end

end
