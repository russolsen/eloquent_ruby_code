require 'uri'

describe URI do

  it 'should work like the book says' do
    my_uri = URI.parse('http://www.russolsen.com')   ##+uri
    my_uri.host.should == 'www.russolsen.com'
    my_uri.scheme.should == 'http'
    my_url.port.should == 80
  end
end
