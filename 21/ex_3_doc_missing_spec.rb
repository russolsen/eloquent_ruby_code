require '../utils/rspec_utils'
require '../code/doc3'

class Document                    ##(main
  # Most of the class omitted... 

  def method_missing( method_name, *args ) 
    msg =  %Q{ 
      You tried to call the method #{method_name} 
       on an instance of Document. There is no such method. 
    } 
    raise msg
  end 
end                                ##main)

describe Document do

  it 'should complain correctly' do
    doc = Document.new('Titanic', 'Cameron', 'Sail, crash, sink') 
    begin
      puts "The text is #{doc.text}" 
    rescue
      $!.message.should match( /.*You tried.*method text.*no such.*/m )
    end
  end
 

end
