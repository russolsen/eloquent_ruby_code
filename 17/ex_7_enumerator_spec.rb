require '../code/doc3'
require '../utils/rspec_utils'
require 'doc_with_each_char'
require 'pp'

describe Document do
  it 'should work with enum' do
    doc = Document.new('example', 'russ', "We are all characters")     ##(main
    enum = doc.enum_for(:each_character )                      ##main)

    a = enum.to_a
    a[0].should == 'W'
    a[1].should == 'e'
    a.last.should == 's'

    sorted = enum.sort
    sorted[0].should == ' '
    sorted[3].should == 'W'

    output_of {
      puts enum.count                   ##+count
    }.should == "21\n"

    out = output_of {
      pp enum.sort               ##+sort
    }
    File.write( 'sorted_chars.txt', out )
  end
end
