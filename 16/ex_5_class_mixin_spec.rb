require '../code/doc3'

module Finders                   ##(finders
  def find_by_name( name ) 
    # Find a document by name... 
  end 

  def find_by_id( doc_id ) 
    # Find a document by id 
  end 
end                              ##finders)


class Document                     ##(inc_doc
  # Most of the class omitted... 

  class << self 
    include Finders 
  end 
end                                ##inc_doc)

describe 'document with finders' do
  it 'should have the right methods' do
    war_and_peace = Document.find_by_name( 'War And Peace' ) ##+war_and_peace
    war_and_peace = Document.find_by_name( '0123456' ) 
  end
end

