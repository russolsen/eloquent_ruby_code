require '../code/doc4'
require '../utils/rspec_utils'

require 'ssdoc_mm'

class SuperSecretDocument                            ##(main
  # Lots of code omitted...

  DELEGATED_METHODS = [ :content, :words ]

  def method_missing(name, *args)
    check_for_expiration
    if DELEGATED_METHODS.include?( name )
      @original_document.send(name, *args)
    else
      super
    end
  end
end                                                  ##main)

describe 'pickier supersecret document' do
  it "should have a good specific method delegation" do
    doc = Document.new( 'The Plans', 'Russ', 'We attack at dawn' )
    sdoc =  SuperSecretDocument.new( doc, 1 )
    sdoc.content.should == 'We attack at dawn'
    sdoc.words.should == %w{We attack at dawn}
    sleep( 1.2 )
    lambda{ sdoc.title }.should raise_error
  end

  it 'should flake out with to_s' do
     doc = Document.new( 'The Plans', 'Russ', 'We attack at dawn' )
     self.should_receive(:get_instructions).and_return(doc)

     out = output_of {
       original_instructions = get_instructions                       ##(to_s
       instructions = SuperSecretDocument.new(original_instructions, 5)
       puts instructions.to_s                                         ##to_s)
     }

     out.should match( /<SuperSecretD/ )
     File.write( 'to_s.txt', out )
  end
end
