require 'encrypting_document'

describe Document do        ##(main
  before :each do
    @doc = Document.new( "test", "tester", "this is a test" )
  end

  it "should encrypt if encryption is enabled" do
    Document.enable_encryption( true )
    @doc.encrypt_string( 'abc' ).should_not == 'abc'
  end

  it "should not encrypt if encryption is disabled" do
    Document.enable_encryption( false )                 ##+enable
    @doc.encrypt_string( 'abc' ).should == 'abc'
  end
end                         ##main)
