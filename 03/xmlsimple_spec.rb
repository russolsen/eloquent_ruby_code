require '../utils/rspec_utils'

describe 'xmlsimple' do

  it 'should work like the book says' do
    require 'xmlsimple'               ##(main
    data = XmlSimple.xml_in('dc.xml') ##main)

    data.instance_of?(Hash).should == true

    out = output_of { pp data } 
    out.should match(/"super-hero".*name.*"Spiderman"/m)
    File.write( "superhero.txt", out )

  end
end
