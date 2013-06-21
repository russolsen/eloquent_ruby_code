require 'readers'

class AsianDocumentReader < DocumentReader             ##(classes
  # Lots of code for dealing with Asian languages...
end

class JapaneseDocumentReader <  AsianDocumentReader
  # Lots of stuff omitted...
end

class ChineseDocumentReader <  AsianDocumentReader
  # Lots of stuff omitted...
end                                                  ##classes)

class AsianDocumentReader < DocumentReader           ##(fix
  def self.can_read?(path) 
    false
  end 

  # Lots of code for dealing with Asian languages... 
end                                                 ##fix)


describe DocumentReader do
  it 'should have an entry for asian documents' do
    readers = DocumentReader.instance_variable_get( :@reader_classes )
    readers.size.should == 6
    readers.should include(AsianDocumentReader)
  end
end
