
def each_name    ##(main
  name_server = open_name_server   # Get some expensive resource
  begin
    while name_server.has_more?
       yield name_server.read_name
    end
  ensure
    name_server.close              # Close the expensive resource
  end
end               ##main)

describe 'each_name method' do

  it 'should work without exceptions' do
    name_server = mock
    self.should_receive(:open_name_server).and_return(name_server)
    name_server.should_receive(:has_more?).and_return( true, true, false )
    name_server.should_receive(:read_name).twice.and_return('name')
    name_server.should_receive(:close)

    each_name {|name| name.should == 'name'}
  end

  it 'should work with exceptions' do
    name_server = mock
    self.should_receive(:open_name_server).and_return(name_server)
    name_server.should_receive(:has_more?).and_return( true )
    name_server.should_receive(:read_name).once.and_return('name')
    name_server.should_receive(:close)

    lambda {  each_name {|name| raise 'oops' } }.should raise_error
  end

end
