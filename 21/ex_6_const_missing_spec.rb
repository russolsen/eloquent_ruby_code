require '../utils/rspec_utils'
require '../code/doc3'

class Document                    ##(main
    # Most of the class omitted... 
  
  def self.const_missing( const_name ) 
    msg =  %Q{ 
      You tried to reference the constant #{const_name} 
      There is no such constant in the Document class. 
    } 
    raise msg 
  end 
end                                ##main)

describe Document do

  it 'should complain correctly' do
    doc = Document.new('Titanic', 'Cameron', 'Sail, crash, sink') 
    begin
      Document::FooBar
    rescue
      $!.message.should match( /.*You tried.*constant FooBar.*no such.*/m )
    end
  end
 

end
