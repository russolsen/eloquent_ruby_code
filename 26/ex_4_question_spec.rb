require 'structured_document'
require 'pp'


class StructuredDocument                                 ##(main
  def self.paragraph_type( paragraph_name, options ) 
    # What do we do in here? 
  end 

  # ... 
end                                                      ##main)


describe StructuredDocument do
  it 'should have the proper methods' do
    StructuredDocument.public_methods.should include( :paragraph_type )
  end
end
