require 'readers'

describe DocumentReader do
  it 'should have a list of all of its subclasses' do
    readers = DocumentReader.instance_variable_get(:@reader_classes)
    readers.size.should == 3
    readers.should include(XMLReader)
    readers.should include(YAMLReader)
    readers.should include(PlainTextReader)
  end

  it 'should be able to read a plain text file' do
    File.open( 'plain.txt', 'w') do |f|
      f.puts( 'Garp' )
      f.puts( 'Irving' )
      f.puts( 'Odd odd odd' )
    end

    doc = DocumentReader.read( 'plain.txt' )
    doc.class.should == Document
    doc.title.should == 'Garp'
    doc.author.should == 'Irving'
    doc.content.should == 'Odd odd odd'
  end

  it 'should pick XMLReader for an XML file' do
    reader = DocumentReader.reader_for( 'foo.xml' )
    reader.class.should == XMLReader
  end

  it 'should pick YAMLReader for an YAML file' do
    reader = DocumentReader.reader_for( 'foo.yaml' )
    reader.class.should == YAMLReader
  end
end
