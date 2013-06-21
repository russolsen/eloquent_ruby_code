require '../code/doc3'

describe 'calling the wrong method' do

  it 'should just blow up' do
    lambda {
      # Error: the method is content, not text!        ##(main
   
      doc = Document.new('Titanic', 'Cameron', 'Sail, crash, sink') 
      puts "The text is #{doc.text}"                  ##main)
    }.should raise_error

  end

end
