class Printer             ##(printer
  def name 
    @name 
  end 

  def name=(value) 
    @name = value 
  end 
end                        ##printer)

describe Printer do
  it 'should have the correct accessors' do
    methods = Printer.instance_methods
    methods.should include(:name)
    methods.should include(:name=)
  end

  it 'should work' do
    p = Printer.new
    p.name.should == nil
    p.name = 'epson'
    p.name.should == 'epson'
  end
end

