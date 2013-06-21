

describe "in the wild examples" do

  it "should have a good file open example" do
    open_file = File.open( '/etc/passwd' )   ##+open
    open_file.close
  end

  it 'should have a good stringio example' do
    require 'stringio'                                                ##(sio
    open_string = StringIO.new( "So say we all!\nSo say we all!\n" )  ##sio)
  end

  it 'should have a good set example' do
    require 'set'
    five_even = [ 2, 4, 6, 8, 10 ]             ##(set
    five_even_set = Set.new( five_even )       ##set)
    five_even_set.size.should == 5
  end
end
