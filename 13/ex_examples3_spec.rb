require 'pp'

describe "Singleton methods in stubs" do                       ##(main
  it "is just a demonstration of stubs as singleton methods" do 
    stub_printer = stub :available? => true, :render => nil 
    pp stub_printer.singleton_methods 
    stub_printer.singleton_methods.should include(:available?) ##--main
    stub_printer.singleton_methods.should include(:render)     ##--main
  end 
end                                                            ##main)
