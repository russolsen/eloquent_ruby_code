require '../code/doc3'

module Finders 
  def find_by_name( name ) 
    # Find a document by name... 
  end 

  def find_by_id( doc_id ) 
    # Find a document by id 
  end 
end


class Document                        ##(extend
  extend Finders

  # Most of the class omitted... 
end                                   ##extend)


describe 'document with finders' do
  it 'should have the right methods' do
    war_and_peace = Document.find_by_name( 'War And Peace' )
    war_and_peace = Document.find_by_name( '0123456' ) 
  end
end

