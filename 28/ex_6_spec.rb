require 'common'
require 'ez_ripper6'


describe 'EzRipper with execute command' do
  it 'should work as described in the book' do
    ezr = EzRipper.new( 'execute.ezr' )
    output_of { ezr.run( 'fellowship.xml' ) }.should match( /author is.*Tol/m )
  end
end

