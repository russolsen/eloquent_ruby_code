require 'erb'
require '../utils/rspec_utils'

describe 'converting erb' do
  it 'should work as described in book' do
    template = File.read('example.erb')
    erb = ERB.new( template )
    out = erb.result
    out.should match( /Today is/ )
    File.write( 'example.erb.out', out )
  end
end
