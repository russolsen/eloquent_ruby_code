require '../utils/rspec_utils'

describe 'running the document spec' do
  it 'should work like described in the book' do
    cmd = "`#{File.read( "doc_spec.cmd" )}`"
    out = eval cmd
    out.should match( /\.\..*Finished/m )
    File.write( 'run_spec.txt', out )
  end
end
