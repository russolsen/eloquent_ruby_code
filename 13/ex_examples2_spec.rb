class Document                    ##(main
  class << self 
    def find_by_name( name ) 
      # Find a document by name... 
    end 
 
    def find_by_id( doc_id ) 
      # Find a document by id 
    end 
  end 
end                              ##main)

  describe Document do
    it "should have the singleton methods" do
      Document.find_by_name( 'doc' )
      Document.find_by_id( '124' )
    end
  end
