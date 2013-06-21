require 'common'
require 'ez_ripper4.rb'

describe EzRipper do
  it 'should handle comments' do
    out = output_of { EzRipper.new( 'comments.ezr').run('fellowship.xml' ) }
    out.should match( /TOL/ )
  end
end

