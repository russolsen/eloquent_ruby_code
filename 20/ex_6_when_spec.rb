
require 'document_reader'

class DocumentReader                          ##(main
  # Stuff omitted... 
end 


class PlainTextReader < DocumentReader 
  # Stuff omitted... 
end 
 
# inherited method for PlainTextReader goes off about now... 

class YAMLReader < DocumentReader 
  # Stuff omitted... 
end 
  
# inherited method for YAMLReader goes off about now... ##main)

describe 'inherit description' do
  it 'should just be syntax. correct' do
    PlainTextReader.superclass.should == DocumentReader
    YAMLReader.superclass.should == DocumentReader
  end
end
