require 'pp'

describe 'uri class methods' do

  it 'should work like the books says' do
    require 'uri'                                       ##(inst

    google = URI.parse( 'http://www.google.com' )

    puts google.scheme        # prints 'http'
    puts google.host          # prints 'www.google.com'  ##inst)

    pp URI.scheme_list           ##+class
  end
end


