require 'ex_printable_document'

describe PrintableDocument do                ##(main
  before :each do 
    @text = 'A bunch of words' 
    @doc = PrintableDocument.new( 'test', 'nobody', @text ) 
  end 

  it 'should know how to print itself' do 
    stub_printer = stub :available? => true, :render => nil  ##+stub_printer
    @doc.print( stub_printer ).should == 'Done'
  end

  it 'should return the proper string if printer is offline' do
    stub_printer = stub :available? => false, :render => nil
    @doc.print( stub_printer ).should == 'Printer unavailable'
  end 
end                                         ##main)
