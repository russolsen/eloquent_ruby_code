require '../utils/rspec_utils'
require '../code/doc3'

class Document                    ##(main
  # Most of the class omitted... 

  def method_missing( method_name, *args ) 
    File.open( 'document.error', 'a' ) do |f| 
      f.puts( "Bad method called: #{method_name}" ) 
      f.puts( "with #{args.size} arguments" ) 
    end 
    super 
  end
end                                ##main)

describe Document do

  it 'should write the error to a file' do
    File.delete('document.error') if File.exist?('document.error')

    doc = Document.new('Titanic', 'Cameron', 'Sail, crash, sink') 

    lambda {
      puts "The text is #{doc.text}" 
    }.should raise_error

    out = File.read( 'document.error' )
    out.should match( /.*Bad method called.*text*/m )
  end
 

end
