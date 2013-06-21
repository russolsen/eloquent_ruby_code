class Printer             ##(printer
  attr_accessor :name 
end                        ##printer)

describe Printer do
  it 'should have the correct accessors' do
    methods = Printer.instance_methods
    methods.should include(:name)
    methods.should include(:name=)
  end
end

